// lib/features/authentication/screens/phone_auth_screen.dart - FIXED VERSION
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/presentation/providers/auth_provider.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/presentation/widgets/custom_button.dart';
import '../../../../core/presentation/widgets/loading_overlay.dart';
import '../../../../l10n/app_localizations.dart';

class PhoneAuthScreen extends ConsumerStatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  ConsumerState<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends ConsumerState<PhoneAuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  String _countryCode = AppConstants.defaultCountryCode;
  bool _isLoading = false;
  String? _verificationId;

  @override
  void initState() {
    super.initState();
    _setupPhoneAuthListener();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _setupPhoneAuthListener() {
    // This will handle the phone auth flow
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      debugPrint('Auth state changed: ${user?.uid}');
      if (user != null && mounted && !_isLoading) {
        // User successfully signed in with phone
        debugPrint('User signed in, navigating...');
        // Add a small delay to ensure auth provider has updated
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            _navigateBasedOnUserState();
          }
        });
      }
    }, onError: (error) {
      debugPrint('Auth state error: $error');
      if (mounted) {
        _showError('Authentication error: $error');
      }
    });
  }

  void _navigateBasedOnUserState() {
    try {
      final authState = ref.read(authProvider);
      if (authState.hasValue) {
        final user = authState.value;

        if (user != null) {
          // Check if user needs to complete profile setup
          if (user.displayName.isEmpty || user.displayName == 'User') {
            context.go('/user-setup');
          } else {
            context.go('/home');
          }
        }
      }
    } catch (e) {
      // Handle any errors gracefully
      debugPrint('Navigation error: $e');
      // Stay on current screen or fallback
    }
  }

  Future<void> _sendOTP() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final phoneNumber = _countryCode + _phoneController.text.trim();

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Auto-verification completed (Android only)
          try {
            await FirebaseAuth.instance.signInWithCredential(credential);
            // Navigation will be handled by the auth state listener
          } catch (e) {
            if (mounted) {
              _showError('Auto-verification failed: $e');
              setState(() => _isLoading = false);
            }
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          if (mounted) {
            _showError(_getPhoneAuthErrorMessage(e.code));
            setState(() => _isLoading = false);
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
          if (mounted) {
            setState(() => _isLoading = false);
            context.push('/otp-verification', extra: {
              'phoneNumber': phoneNumber,
              'verificationId': verificationId,
            });
          }
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
        },
        timeout: const Duration(seconds: 60),
      );
    } catch (e) {
      if (mounted) {
        _showError('Failed to send OTP: $e');
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

  String _getPhoneAuthErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'invalid-phone-number':
        return 'The phone number format is invalid';
      case 'too-many-requests':
        return 'Too many attempts. Please try again later';
      case 'quota-exceeded':
        return 'SMS quota exceeded. Please try again later';
      case 'user-disabled':
        return 'This phone number has been disabled';
      default:
        return 'Failed to verify phone number. Please try again';
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

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
              child: Form(
                key: _formKey,
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

                    // App Logo
                    Center(
                      child: Container(
                        width: 80.w,
                        height: 80.w,
                        decoration: BoxDecoration(
                          color: theme.primaryColor.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.phone_android,
                          size: 40.w,
                          color: theme.primaryColor,
                        ),
                      ),
                    ),

                    SizedBox(height: 24.h),

                    // Welcome Text
                    Text(
                      l10n.welcomeToLocalMarket,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 8.h),

                    Text(
                      l10n.enterPhoneNumberToGetStarted,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.textTheme.bodySmall?.color,
                      ),
                    ),

                    SizedBox(height: 32.h),

                    // Phone Number Input
                    Text(
                      l10n.phoneNumber,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: 8.h),

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: theme.dividerColor),
                        borderRadius: BorderRadius.circular(AppConstants.borderRadius.r),
                        color: Colors.grey[50],
                      ),
                      child: Row(
                        children: [
                          // Country Code Picker
                          CountryCodePicker(
                            onChanged: (country) {
                              _countryCode = country.dialCode!;
                            },
                            initialSelection: AppConstants.countryCode,
                            favorite: const [AppConstants.countryCode],
                            showCountryOnly: false,
                            showOnlyCountryWhenClosed: false,
                            alignLeft: false,
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            textStyle: theme.textTheme.bodyMedium,
                            backgroundColor: Colors.transparent,
                            barrierColor: Colors.black54,
                            boxDecoration: const BoxDecoration(),
                          ),

                          Container(
                            width: 1,
                            height: 30.h,
                            color: theme.dividerColor,
                          ),

                          // Phone Number Field
                          Expanded(
                            child: TextFormField(
                              controller: _phoneController,
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(9),
                              ],
                              decoration: InputDecoration(
                                hintText: l10n.enterPhoneNumber,
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 16.h,
                                ),
                                hintStyle: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.textTheme.bodySmall?.color,
                                ),
                              ),
                              style: theme.textTheme.bodyMedium,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return l10n.phoneNumberRequired;
                                }
                                if (value.length < 9) {
                                  return l10n.validPhoneNumberRequired;
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16.h),

                    // Info Text
                    Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: theme.primaryColor.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                          color: theme.primaryColor.withOpacity(0.2),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: theme.primaryColor,
                            size: 16.w,
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: Text(
                              'We\'ll send you a verification code via SMS',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Spacer(),

                    // Terms and Privacy Notice
                    RichText(
                      text: TextSpan(
                        style: theme.textTheme.bodySmall,
                        children: [
                          TextSpan(text: l10n.byContinuingYouAgree),
                          TextSpan(
                            text: l10n.termsOfService,
                            style: TextStyle(
                              color: theme.primaryColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(text: ' ${l10n.and} '),
                          TextSpan(
                            text: l10n.privacyPolicy,
                            style: TextStyle(
                              color: theme.primaryColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16.h),

                    // Continue Button
                    CustomButton(
                      text: l10n.continueText,
                      onPressed: _sendOTP,
                      isLoading: _isLoading,
                    ),

                    SizedBox(height: 12.h),

                    // Alternative Sign In
                    Center(
                      child: TextButton(
                        onPressed: () => context.go('/email-auth'),
                        child: Text(
                          'Sign in with Email instead',
                          style: TextStyle(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
