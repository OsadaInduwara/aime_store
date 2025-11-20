// lib/features/authentication/screens/email_verification_screen.dart - FIXED VERSION
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import '../../../../core/presentation/providers/auth_provider.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/presentation/widgets/custom_button.dart';
import '../../../../l10n/app_localizations.dart';

class EmailVerificationScreen extends ConsumerStatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  ConsumerState<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends ConsumerState<EmailVerificationScreen> {
  Timer? _timer;
  bool _isLoading = false;
  bool _canResend = true;
  int _resendCooldown = 0;

  @override
  void initState() {
    super.initState();
    _startEmailVerificationCheck();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startEmailVerificationCheck() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      try {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          await user.reload();
          final updatedUser = FirebaseAuth.instance.currentUser;

          if (updatedUser != null && updatedUser.emailVerified) {
            timer.cancel();
            if (mounted) {
              // Reload auth provider to get updated user data
              await ref.read(authProvider.notifier).reloadUser();

              // Navigate based on auth state
              final authState = ref.read(authProvider);
              authState.when(
                unauthenticated: () => context.go('/auth-selection'),
                authenticating: (message) {
                  // Wait for authentication to complete
                },
                authenticated: (user) => context.go('/home'),
                error: (exception) => context.go('/auth-selection'),
                emailVerificationRequired: (email) {
                  // Stay on this screen
                },
                phoneVerificationRequired: (phoneNumber, verificationId) {
                  // Not applicable
                },
                profileSetupRequired: (user) => context.go('/user-setup'),
              );
            }
          }
        }
      } catch (e) {
        debugPrint('Email verification check error: $e');
      }
    });
  }


  Future<void> _resendVerificationEmail() async {
    if (!_canResend) return;

    setState(() => _isLoading = true);

    try {
      await ref.read(authProvider.notifier).sendEmailVerification();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.verificationEmailSent),
            backgroundColor: Colors.green,
          ),
        );

        // Start cooldown
        setState(() {
          _canResend = false;
          _resendCooldown = 60;
        });

        _startResendCooldown();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to send verification email: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _startResendCooldown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_resendCooldown <= 0) {
        timer.cancel();
        if (mounted) {
          setState(() => _canResend = true);
        }
      } else {
        if (mounted) {
          setState(() => _resendCooldown--);
        }
      }
    });
  }

  Future<void> _signOut() async {
    try {
      await ref.read(authProvider.notifier).signOut();
      if (mounted) {
        context.go('/auth-selection');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to sign out: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppConstants.defaultPadding.w),
          child: Column(
            children: [
              const Spacer(),

              // Email Icon
              Container(
                width: 100.w,
                height: 100.w,
                decoration: BoxDecoration(
                  color: theme.primaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.mark_email_unread,
                  size: 50.w,
                  color: theme.primaryColor,
                ),
              ),

              SizedBox(height: 32.h),

              Text(
                l10n.verifyYourEmail,
                style: theme.textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 16.h),

              Text(
                'We\'ve sent a verification email to:',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.textTheme.bodySmall?.color,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 8.h),

              Text(
                user?.email ?? '',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.primaryColor,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 16.h),

              Text(
                'Please check your email and click the verification link to continue.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.textTheme.bodySmall?.color,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 24.h),

              // Auto-checking message
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: theme.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20.w,
                      height: 20.w,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: theme.primaryColor,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Text(
                        'Checking verification status...',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Resend Button
              CustomButton(
                text: _canResend
                    ? l10n.resendVerificationEmail
                    : 'Resend in ${_resendCooldown}s',
                onPressed: _canResend ? _resendVerificationEmail : null,
                isLoading: _isLoading,
                isOutlined: true,
              ),

              SizedBox(height: 16.h),

              // Use Another Email Button
              TextButton(
                onPressed: _signOut,
                child: Text(l10n.useAnotherEmail),
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
