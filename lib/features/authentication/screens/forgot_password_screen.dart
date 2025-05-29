import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/providers/auth_provider.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../core/widgets/loading_overlay.dart';
import '../../../l10n/app_localizations.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState
    extends ConsumerState<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isLoading = false;
  bool _emailSent = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _sendPasswordResetEmail() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    try {
      await ref.read(authProvider.notifier).sendPasswordResetEmail(
        _emailController.text.trim(),
      );
      setState(() => _emailSent = true);
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
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: LoadingOverlay(
        isLoading: _isLoading,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppConstants.defaultPadding.w),
          child: _emailSent
              ? _buildSuccessView(l10n, theme)
              : _buildFormView(l10n, theme),
        ),
      ),
    );
  }

  Widget _buildFormView(AppLocalizations l10n, ThemeData theme) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40.h),
          Center(
            child: Container(
              width: 80.w,
              height: 80.w,
              decoration: BoxDecoration(
                color: theme.primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.lock_reset,
                size: 40.w,
                color: theme.primaryColor,
              ),
            ),
          ),
          SizedBox(height: 32.h),
          Text(
            l10n.forgotPassword,
            style: theme.textTheme.displaySmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.h),
          Text(
            l10n.enterEmailToResetPassword,
            style: theme.textTheme.bodyLarge
                ?.copyWith(color: theme.textTheme.bodySmall?.color),
          ),
          SizedBox(height: 32.h),
          CustomTextField(
            controller: _emailController,
            label: l10n.email,
            hint: l10n.enterYourEmail,
            prefixIcon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return l10n.emailRequired;
              }
              if (!RegExp(r'^[\w\.-]+@([\w-]+\.)+[\w-]{2,4}$')
                  .hasMatch(value)) {
                return l10n.validEmailRequired;
              }
              return null;
            },
          ),
          SizedBox(height: 32.h),
          CustomButton(
            text: l10n.sendResetEmail,
            onPressed: _sendPasswordResetEmail,
            isLoading: _isLoading,
          ),
          SizedBox(height: 24.h),
          Center(
            child: TextButton(
              onPressed: () => context.pop(),
              child: Text(l10n.backToSignIn),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessView(AppLocalizations l10n, ThemeData theme) {
    return Column(
      children: [
        SizedBox(height: 60.h),
        Container(
          width: 100.w,
          height: 100.w,
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.mark_email_read,
            size: 50.w,
            color: Colors.green,
          ),
        ),
        SizedBox(height: 32.h),
        Text(
          l10n.emailSent,
          style: theme.textTheme.displaySmall
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16.h),
        Text(
          l10n.passwordResetEmailSent(_emailController.text.trim()),
          style: theme.textTheme.bodyLarge
              ?.copyWith(color: theme.textTheme.bodySmall?.color),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 32.h),
        CustomButton(
          text: l10n.openEmailApp,
          onPressed: () {
            // TODO: launch default mail app
          },
        ),
        SizedBox(height: 16.h),
        TextButton(
          onPressed: _sendPasswordResetEmail,
          child: Text(l10n.resendEmail),
        ),
        SizedBox(height: 24.h),
        TextButton(
          onPressed: () => context.pop(),
          child: Text(l10n.backToSignIn),
        ),
      ],
    );
  }
}
