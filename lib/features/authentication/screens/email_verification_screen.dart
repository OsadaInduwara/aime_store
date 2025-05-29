// lib/features/authentication/screens/email_verification_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';

import '../../../core/providers/auth_provider.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../l10n/app_localizations.dart';

class EmailVerificationScreen extends ConsumerStatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  ConsumerState<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends ConsumerState<EmailVerificationScreen> {
  Timer? _timer;
  bool _isLoading = false;

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
      await ref.read(authProvider.notifier).reloadUser();
      final user = ref.read(authProvider).value;

      if (user != null && mounted) {
        timer.cancel();
        context.go('/user-setup');
      }
    });
  }

  Future<void> _resendVerificationEmail() async {
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
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

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
              ),

              SizedBox(height: 16.h),

              Text(
                l10n.verificationEmailSentDescription,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.textTheme.bodySmall?.color,
                ),
                textAlign: TextAlign.center,
              ),

              const Spacer(),

              CustomButton(
                text: l10n.resendVerificationEmail,
                onPressed: _resendVerificationEmail,
                isLoading: _isLoading,
              ),

              SizedBox(height: 16.h),

              TextButton(
                onPressed: () {
                  ref.read(authProvider.notifier).signOut();
                  context.go('/auth-selection');
                },
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