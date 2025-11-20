// lib/features/authentication/screens/auth_selection_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/presentation/widgets/custom_button.dart';
import '../../../../l10n/app_localizations.dart';

class AuthSelectionScreen extends StatelessWidget {
  const AuthSelectionScreen({super.key});

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

              // App Logo
              Container(
                width: 120.w,
                height: 120.w,
                decoration: BoxDecoration(
                  color: theme.primaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.shopping_bag_outlined,
                  size: 60.w,
                  color: theme.primaryColor,
                ),
              ),

              SizedBox(height: 24.h),

              Text(
                AppConstants.appName,
                style: theme.textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 8.h),

              Text(
                l10n.yourLocalMarketplace,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.textTheme.bodySmall?.color,
                ),
                textAlign: TextAlign.center,
              ),

              const Spacer(),

              // Phone Number Sign In
              CustomButton(
                text: l10n.continueWithPhone,
                onPressed: () => context.push('/phone-auth'),
                icon: Icon(Icons.phone, size: 20.w),
              ),

              SizedBox(height: 16.h),

              // Email Sign In
              CustomButton(
                text: l10n.continueWithEmail,
                onPressed: () => context.push('/email-auth'),
                isOutlined: true,
                icon: Icon(Icons.email_outlined, size: 20.w),
              ),

              SizedBox(height: 24.h),

              // Divider
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

              // Social Sign In Options
              Row(
                children: [
                  Expanded(
                    child: _SocialButton(
                      icon: 'assets/icons/google.svg',
                      label: 'Google',
                      onPressed: () => context.push('/social-auth/google'),
                    ),
                  ),

                  SizedBox(width: 16.w),

                  Expanded(
                    child: _SocialButton(
                      icon: 'assets/icons/facebook.svg',
                      label: 'Facebook',
                      onPressed: () => context.push('/social-auth/facebook'),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40.h),

              // Terms and Privacy
              RichText(
                textAlign: TextAlign.center,
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

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onPressed;

  const _SocialButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        side: BorderSide(color: theme.dividerColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SvgPicture.asset(
          //   icon,
          //   width: 20.w,
          //   height: 20.w,
          // ),
          Icon(
            label == 'Google' ? Icons.g_mobiledata : Icons.facebook,
            size: 20.w,
            color: label == 'Google' ? Colors.red : Colors.blue,
          ),
          SizedBox(width: 8.w),
          Text(label),
        ],
      ),
    );
  }
}
