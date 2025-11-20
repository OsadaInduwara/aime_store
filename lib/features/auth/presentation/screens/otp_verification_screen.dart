// lib/features/authentication/screens/otp_verification_screen.dart - FIXED VERSION
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import '../../../../core/presentation/providers/auth_provider.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/presentation/widgets/custom_button.dart';
import '../../../../core/presentation/widgets/loading_overlay.dart';
import '../../../../l10n/app_localizations.dart';

class OTPVerificationScreen extends ConsumerStatefulWidget {
  final String phoneNumber;
  final String verificationId;

  const OTPVerificationScreen({
    super.key,
    required this.phoneNumber,
    required this.verificationId,
  });

  @override
  ConsumerState<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends ConsumerState<OTPVerificationScreen> {
  final _pinController = TextEditingController();
  bool _isLoading = false;
  int _resendTimer = AppConstants.otpTimeoutSeconds;
  Timer? _timer;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startResendTimer();
    _setupAuthListener();
  }

  @override
  void dispose() {
    _pinController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _setupAuthListener() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      debugPrint('OTP Auth state changed: ${user?.uid}');
      if (user != null && mounted && !_isLoading) {
        debugPrint('User verified, navigating...');
        // Add a small delay to ensure auth provider has updated
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            _navigateBasedOnUserState();
          }
        });
      }
    }, onError: (error) {
      debugPrint('OTP Auth state error: $error');
      if (mounted) {
        _showError('Authentication error: $error');
      }
    });
  }

  void _navigateBasedOnUserState() {
    try {
      debugPrint('OTP: Attempting to navigate based on user state...');
      final authState = ref.read(authProvider);
      debugPrint('OTP: Auth state: loading=${authState.isLoading}, hasValue=${authState.hasValue}, hasError=${authState.hasError}');

      if (authState.hasValue) {
        final user = authState.value;
        debugPrint('OTP: User data: ${user?.id}, displayName=${user?.displayName}');

        if (user != null) {
          // Check if user needs to complete profile setup
          if (user.displayName.isEmpty || user.displayName == 'User') {
            debugPrint('OTP: Navigating to user setup...');
            context.go('/user-setup');
          } else {
            debugPrint('OTP: Navigating to home...');
            context.go('/home');
          }
        } else {
          debugPrint('OTP: User is null, staying on current screen');
        }
      } else if (authState.hasError) {
        debugPrint('OTP: Auth state has error: ${authState.error}');
        // For now, navigate to user setup if there's an error but user is authenticated
        final firebaseUser = FirebaseAuth.instance.currentUser;
        if (firebaseUser != null) {
          debugPrint('OTP: Firebase user exists, navigating to user setup...');
          context.go('/user-setup');
        }
      } else if (authState.isLoading) {
        debugPrint('OTP: Auth state is still loading...');
        // Wait a bit more, or fallback to manual navigation
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            final firebaseUser = FirebaseAuth.instance.currentUser;
            if (firebaseUser != null) {
              debugPrint('OTP: Timeout - Firebase user exists, navigating to user setup...');
              context.go('/user-setup');
            }
          }
        });
      }
    } catch (e, stackTrace) {
      // Handle any errors gracefully
      debugPrint('OTP: Navigation error: $e');
      debugPrint('OTP: Stack trace: $stackTrace');

      // Fallback navigation
      final firebaseUser = FirebaseAuth.instance.currentUser;
      if (firebaseUser != null) {
        debugPrint('OTP: Error fallback - navigating to user setup...');
        context.go('/user-setup');
      }
    }
  }

  void _startResendTimer() {
    _canResend = false;
    _resendTimer = AppConstants.otpTimeoutSeconds;

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_resendTimer == 0) {
        timer.cancel();
        if (mounted) {
          setState(() => _canResend = true);
        }
      } else {
        if (mounted) {
          setState(() => _resendTimer--);
        }
      }
    });
  }

  Future<void> _verifyOTP() async {
    if (_pinController.text.length != AppConstants.otpLength) return;

    setState(() => _isLoading = true);

    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: _pinController.text,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      // Navigation will be handled by the auth state listener
    } catch (e) {
      if (mounted) {
        _showError(_getOTPErrorMessage(e.toString()));
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _resendOTP() async {
    if (!_canResend) return;

    setState(() => _isLoading = true);

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: widget.phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          try {
            await FirebaseAuth.instance.signInWithCredential(credential);
          } catch (e) {
            if (mounted) {
              _showError('Auto-verification failed: $e');
            }
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          if (mounted) {
            _showError(_getPhoneAuthErrorMessage(e.code));
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          // Update the verification ID for this screen
          // Note: In a real app, you'd want to pass this back properly
          _startResendTimer();
          if (mounted) {
            _showSuccess('OTP sent successfully');
          }
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Handle timeout
        },
        timeout: const Duration(seconds: 60),
      );
    } catch (e) {
      if (mounted) {
        _showError('Failed to resend OTP: $e');
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 4),
      ),
    );
  }

  void _showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  String _getOTPErrorMessage(String error) {
    if (error.contains('invalid-verification-code')) {
      return 'Invalid verification code. Please try again.';
    } else if (error.contains('session-expired')) {
      return 'Verification session expired. Please request a new code.';
    } else if (error.contains('too-many-requests')) {
      return 'Too many attempts. Please try again later.';
    }
    return 'Verification failed. Please try again.';
  }

  String _getPhoneAuthErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'invalid-phone-number':
        return 'The phone number format is invalid';
      case 'too-many-requests':
        return 'Too many attempts. Please try again later';
      case 'quota-exceeded':
        return 'SMS quota exceeded. Please try again later';
      default:
        return 'Failed to send OTP. Please try again';
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    final defaultPinTheme = PinTheme(
      width: 50.w,
      height: 50.w,
      textStyle: theme.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: theme.dividerColor),
        borderRadius: BorderRadius.circular(AppConstants.borderRadius.r),
        color: Colors.grey[50],
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: theme.primaryColor, width: 2),
      color: theme.primaryColor.withOpacity(0.05),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: theme.primaryColor.withOpacity(0.1),
        border: Border.all(color: theme.primaryColor),
      ),
    );

    final errorPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.red, width: 2),
      color: Colors.red.withOpacity(0.05),
    );

    return Scaffold(
      body: LoadingOverlay(
        isLoading: _isLoading,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(AppConstants.defaultPadding.w),
            child: SizedBox(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Button
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(Icons.arrow_back),
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                  ),

                  SizedBox(height: 20.h),

                  // Header Icon
                  Center(
                    child: Container(
                      width: 80.w,
                      height: 80.w,
                      decoration: BoxDecoration(
                        color: theme.primaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.sms_outlined,
                        size: 40.w,
                        color: theme.primaryColor,
                      ),
                    ),
                  ),

                  SizedBox(height: 24.h),

                  // Title
                  Text(
                    l10n.verifyPhoneNumber,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8.h),

                  // Subtitle
                  RichText(
                    text: TextSpan(
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.textTheme.bodySmall?.color,
                      ),
                      children: [
                        TextSpan(text: l10n.enterCodeSentTo),
                        TextSpan(
                          text: ' ${widget.phoneNumber}',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: theme.textTheme.bodyLarge?.color,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 32.h),

                  // OTP Input
                  Center(
                    child: Pinput(
                      controller: _pinController,
                      length: AppConstants.otpLength,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      submittedPinTheme: submittedPinTheme,
                      errorPinTheme: errorPinTheme,
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      showCursor: true,
                      onCompleted: (pin) => _verifyOTP(),
                      onChanged: (value) {
                        // Clear any previous errors when user starts typing
                      },
                    ),
                  ),

                  SizedBox(height: 24.h),

                  // Resend OTP Section
                  Center(
                    child: Column(
                      children: [
                        if (_canResend)
                          TextButton(
                            onPressed: _resendOTP,
                            child: Text(
                              l10n.resendCode,
                              style: TextStyle(
                                color: theme.primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                              ),
                            ),
                          )
                        else
                          Text(
                            l10n.resendCodeIn(_resendTimer),
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.textTheme.bodySmall?.color,
                            ),
                          ),

                        SizedBox(height: 12.h),

                        // Wrong number option
                        TextButton(
                          onPressed: () => context.pop(),
                          child: Text(
                            'Wrong number?',
                            style: TextStyle(
                              color: theme.textTheme.bodySmall?.color,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  // Verify Button
                  CustomButton(
                    text: l10n.verify,
                    onPressed: _pinController.text.length == AppConstants.otpLength
                        ? _verifyOTP
                        : null,
                    isLoading: _isLoading,
                  ),

                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
