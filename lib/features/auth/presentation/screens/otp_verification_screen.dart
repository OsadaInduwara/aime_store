// lib/features/auth/presentation/screens/otp_verification_screen.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/presentation/providers/auth_provider.dart';
import '../../../../core/presentation/widgets/custom_button.dart';
import '../../../../core/presentation/widgets/smooth_loading_overlay.dart';
import '../../../../core/data/models/auth_state.dart';
import '../../../../core/services/error_service.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../l10n/app_localizations.dart';

class OTPVerificationScreen extends ConsumerStatefulWidget {
  const OTPVerificationScreen({
    super.key,
    required this.phoneNumber,
    required this.verificationId,
  });

  final String phoneNumber;
  final String verificationId;

  @override
  ConsumerState<OTPVerificationScreen> createState() =>
      _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends ConsumerState<OTPVerificationScreen>
    with TickerProviderStateMixin {
  final _pinController = TextEditingController();
  final _focusNode = FocusNode();

  Timer? _timer;
  int _secondsRemaining = 60;
  bool _canResend = false;
  bool _isOTPComplete = false;

  late AnimationController _shakeController;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();
    _startTimer();
    _setupAnimations();

    // Auto-focus on OTP input
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
      _listenToAuthState();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pinController.dispose();
    _focusNode.dispose();
    _shakeController.dispose();
    super.dispose();
  }

  void _setupAnimations() {
    _shakeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _shakeAnimation = Tween<double>(begin: 0, end: 10)
        .animate(CurvedAnimation(parent: _shakeController, curve: Curves.elasticIn));
  }

  void _listenToAuthState() {
    ref.listen<AuthState>(authProvider, (previous, next) {
      if (!mounted) return;

      next.when(
        unauthenticated: () {
          // Handle unauthenticated state
        },
        authenticating: (message) {
          // Loading state is handled by overlay
        },
        authenticated: (user) {
          ErrorService.showSuccess(context, 'Phone verified successfully!');
          context.go('/home');
        },
        error: (exception) {
          // Shake animation for error feedback
          _shakeController.forward().then((_) {
            _shakeController.reverse();
            _pinController.clear();
            setState(() {
              _isOTPComplete = false;
            });
          });
        },
        emailVerificationRequired: (email) {
          context.push('/email-verification');
        },
        phoneVerificationRequired: (phoneNumber, verificationId) {
          // Stay on current screen
        },
        profileSetupRequired: (user) {
          context.go('/user-setup');
        },
      );
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          if (_secondsRemaining > 0) {
            _secondsRemaining--;
          } else {
            _canResend = true;
            _timer?.cancel();
          }
        });
      }
    });
  }

  Future<void> _verifyOTP() async {
    if (!_isOTPComplete) return;

    HapticFeedback.lightImpact();
    _focusNode.unfocus();

    final authController = ref.read(authControllerProvider);
    final result = await authController.verifyOTP(
      widget.verificationId,
      _pinController.text,
    );

    if (mounted) {
      result.when(
        success: (user, message) {
          // Success is handled in the auth state listener
        },
        error: (exception) {
          // Error is handled in the auth state listener
        },
        requiresAction: (actionType, data, message) {
          // Handle additional actions if needed
        },
      );
    }
  }

  Future<void> _resendOTP() async {
    if (!_canResend) return;

    HapticFeedback.lightImpact();

    final authController = ref.read(authControllerProvider);
    final result = await authController.signInWithPhone(widget.phoneNumber);

    if (mounted) {
      result.when(
        success: (user, message) {
          if (message != null) {
            ErrorService.showInfo(context, message);
          }
        },
        error: (exception) {
          // Error handling is done in provider
        },
        requiresAction: (actionType, data, message) {
          if (message != null) {
            ErrorService.showInfo(context, message);
          }
          // Reset timer
          setState(() {
            _secondsRemaining = 60;
            _canResend = false;
          });
          _startTimer();
        },
      );
    }
  }

  String get _formattedTime {
    final minutes = (_secondsRemaining ~/ 60).toString().padLeft(2, '0');
    final seconds = (_secondsRemaining % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  String get _maskedPhoneNumber {
    if (widget.phoneNumber.length < 4) return widget.phoneNumber;
    final visiblePart = widget.phoneNumber.substring(widget.phoneNumber.length - 4);
    final hiddenPart = '*' * (widget.phoneNumber.length - 4);
    return '$hiddenPart$visiblePart';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final authState = ref.watch(authProvider);

    final isLoading = authState.maybeWhen(
      authenticating: (message) => true,
      orElse: () => false,
    );

    final loadingMessage = authState.maybeWhen(
      authenticating: (message) => message,
      orElse: () => null,
    );

    // Pin theme
    final defaultPinTheme = PinTheme(
      width: 50.w,
      height: 50.w,
      textStyle: theme.textTheme.headlineSmall?.copyWith(
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: theme.dividerColor),
        borderRadius: BorderRadius.circular(12.r),
        color: theme.colorScheme.surface,
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: theme.colorScheme.primary, width: 2),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.1),
        border: Border.all(color: theme.colorScheme.primary),
      ),
    );

    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: theme.colorScheme.error),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Verify Phone'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppConstants.defaultPadding.w),
        child: AnimatedBuilder(
          animation: _shakeAnimation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(_shakeAnimation.value, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 20.h),

                  // Header
                  Text(
                    'Enter verification code',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 8.h),

                  Text(
                    'We sent a 6-digit code to $_maskedPhoneNumber',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.textTheme.bodySmall?.color,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 40.h),

                  // OTP Input
                  Pinput(
                    controller: _pinController,
                    focusNode: _focusNode,
                    length: AppConstants.otpLength,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    errorPinTheme: errorPinTheme,
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    separatorBuilder: (index) => SizedBox(width: 12.w),
                    onCompleted: (pin) {
                      setState(() {
                        _isOTPComplete = true;
                      });
                      _verifyOTP();
                    },
                    onChanged: (pin) {
                      setState(() {
                        _isOTPComplete = pin.length == AppConstants.otpLength;
                      });
                    },
                    hapticFeedbackType: HapticFeedbackType.lightImpact,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),

                  SizedBox(height: 40.h),

                  // Verify button (manual trigger)
                  CustomButton(
                    text: 'Verify Code',
                    onPressed: (_isOTPComplete && !isLoading) ? _verifyOTP : null,
                  ),

                  SizedBox(height: 24.h),

                  // Timer and resend
                  Center(
                    child: _canResend
                        ? TextButton(
                            onPressed: isLoading ? null : _resendOTP,
                            child: Text('Resend Code'),
                          )
                        : Text(
                            'Resend code in $_formattedTime',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.textTheme.bodySmall?.color,
                            ),
                          ),
                  ),

                  SizedBox(height: 40.h),

                  // Change number option
                  TextButton(
                    onPressed: isLoading ? null : () => context.pop(),
                    child: Text('Change phone number'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ).withSmoothLoading(
      isLoading: isLoading,
      message: loadingMessage,
    );
  }
}
