// lib/features/auth/presentation/screens/phone_auth_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/presentation/providers/auth_provider.dart';
import '../../../../core/presentation/widgets/custom_button.dart';
import '../../../../core/presentation/widgets/smooth_loading_overlay.dart';
import '../../../../core/data/models/auth_state.dart';
import '../../../../core/services/error_service.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../l10n/app_localizations.dart';

class PhoneAuthScreen extends ConsumerStatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  ConsumerState<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends ConsumerState<PhoneAuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _focusNode = FocusNode();

  String _countryCode = AppConstants.defaultCountryCode;
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(_validateForm);

    // Listen to authentication state changes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _listenToAuthState();
    });
  }

  @override
  void dispose() {
    _phoneController.removeListener(_validateForm);
    _phoneController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _listenToAuthState() {
    ref.listen<AuthState>(authProvider, (previous, next) {
      if (!mounted) return;

      next.when(
        unauthenticated: () {
          // Handle unauthenticated state
        },
        authenticating: (message) {
          // Loading state is handled by the overlay
        },
        authenticated: (user) {
          // Navigate to home
          context.go('/home');
        },
        error: (exception) {
          // Error is handled by ErrorService in the provider
        },
        emailVerificationRequired: (email) {
          context.push('/email-verification');
        },
        phoneVerificationRequired: (phoneNumber, verificationId) {
          // Navigate to OTP verification
          context.push('/otp-verification', extra: {
            'phoneNumber': phoneNumber,
            'verificationId': verificationId,
          });
        },
        profileSetupRequired: (user) {
          context.go('/user-setup');
        },
      );
    });
  }

  void _validateForm() {
    final isValid = _phoneController.text.length >= 9; // Minimum phone number length
    if (_isButtonEnabled != isValid) {
      setState(() {
        _isButtonEnabled = isValid;
      });
    }
  }

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    if (value.length < 9) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  Future<void> _sendOTP() async {
    if (!_formKey.currentState!.validate()) return;

    // Unfocus to hide keyboard smoothly
    _focusNode.unfocus();

    final phoneNumber = '$_countryCode${_phoneController.text.trim()}';
    final authController = ref.read(authControllerProvider);

    final result = await authController.signInWithPhone(phoneNumber);

    if (mounted) {
      result.when(
        success: (user, message) {
          if (message != null) {
            ErrorService.showSuccess(context, message);
          }
        },
        error: (exception) {
          // Error handling is already done in the provider
        },
        requiresAction: (actionType, data, message) {
          if (message != null) {
            ErrorService.showInfo(context, message);
          }
        },
      );
    }
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

    return Scaffold(
      appBar: AppBar(
        title: Text('${l10n.phoneNumber} Verification'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppConstants.defaultPadding.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20.h),

              // Header
              Text(
                l10n.enterPhoneNumberToGetStarted,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 8.h),

              Text(
                'We\'ll send you a verification code',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.textTheme.bodySmall?.color,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 40.h),

              // Phone number input
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: theme.dividerColor),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  children: [
                    // Country code picker
                    CountryCodePicker(
                      onChanged: (country) {
                        setState(() {
                          _countryCode = country.dialCode!;
                        });
                      },
                      initialSelection: AppConstants.countryCode,
                      favorite: const ['+94', '+1', '+44'],
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                      padding: EdgeInsets.zero,
                      textStyle: theme.textTheme.bodyLarge,
                      dialogTextStyle: theme.textTheme.bodyMedium,
                      searchStyle: theme.textTheme.bodyMedium,
                      dialogBackgroundColor: theme.colorScheme.surface,
                      barrierColor: Colors.black54,
                    ),

                    // Divider
                    Container(
                      width: 1,
                      height: 40.h,
                      color: theme.dividerColor,
                    ),

                    // Phone number field
                    Expanded(
                      child: TextFormField(
                        controller: _phoneController,
                        focusNode: _focusNode,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10),
                        ],
                        decoration: InputDecoration(
                          hintText: l10n.phoneNumber,
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 16.h,
                          ),
                        ),
                        validator: _validatePhoneNumber,
                        onFieldSubmitted: (_) {
                          if (_isButtonEnabled) _sendOTP();
                        },
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40.h),

              // Send OTP button
              CustomButton(
                text: 'Send Verification Code',
                onPressed: _isButtonEnabled ? _sendOTP : null,
              ),

              SizedBox(height: 24.h),

              // Alternative sign in option
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      l10n.orContinueWith,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.textTheme.bodySmall?.color,
                      ),
                    ),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),

              SizedBox(height: 24.h),

              // Email sign in button
              OutlinedButton(
                onPressed: isLoading ? null : () => context.go('/email-auth'),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.email_outlined, size: 20.w),
                    SizedBox(width: 8.w),
                    Text(l10n.continueWithEmail),
                  ],
                ),
              ),

              SizedBox(height: 40.h),

              // Terms and conditions
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: theme.textTheme.bodySmall,
                  children: [
                    TextSpan(text: l10n.byContinuingYouAgree),
                    TextSpan(
                      text: l10n.termsOfService,
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(text: ' ${l10n.and} '),
                    TextSpan(
                      text: l10n.privacyPolicy,
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ).withSmoothLoading(
      isLoading: isLoading,
      message: loadingMessage,
    );
  }
}
