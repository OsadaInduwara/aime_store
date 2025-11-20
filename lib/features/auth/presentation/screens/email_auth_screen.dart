// lib/features/authentication/screens/email_auth_screen.dart - FIXED VERSION
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/presentation/providers/auth_provider.dart';
import '../../../../core/data/models/auth_state.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/presentation/widgets/custom_button.dart';
import '../../../../core/presentation/widgets/custom_text_field.dart';
import '../../../../core/presentation/widgets/smooth_loading_overlay.dart';
import '../../../../l10n/app_localizations.dart';

class EmailAuthScreen extends ConsumerStatefulWidget {
  const EmailAuthScreen({super.key});

  @override
  ConsumerState<EmailAuthScreen> createState() => _EmailAuthScreenState();
}

class _EmailAuthScreenState extends ConsumerState<EmailAuthScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _signInFormKey = GlobalKey<FormState>();
  final _signUpFormKey = GlobalKey<FormState>();

  // Sign In Controllers
  final _signInEmailController = TextEditingController();
  final _signInPasswordController = TextEditingController();

  // Sign Up Controllers
  final _signUpNameController = TextEditingController();
  final _signUpEmailController = TextEditingController();
  final _signUpPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();



  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _setupAuthListener();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _signInEmailController.dispose();
    _signInPasswordController.dispose();
    _signUpNameController.dispose();
    _signUpEmailController.dispose();
    _signUpPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _setupAuthListener() {
    // Listen to auth state changes using Riverpod
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.listen<AuthState>(authProvider, (previous, next) {
        if (!mounted) return;

        next.when(
          unauthenticated: () {
            // Stay on auth screen
          },
          authenticating: (message) {
            // Loading is handled by smooth overlay
          },
          authenticated: (user) {
            context.go('/home');
          },
          error: (exception) {
            // Error is handled by ErrorService in provider
          },
          emailVerificationRequired: (email) {
            context.go('/email-verification');
          },
          phoneVerificationRequired: (phoneNumber, verificationId) {
            // Not applicable for email auth
          },
          profileSetupRequired: (user) {
            context.go('/user-setup');
          },
        );
      });
    });
  }



  Future<void> _signIn() async {
    if (!_signInFormKey.currentState!.validate()) return;

    final authController = ref.read(authControllerProvider);
    final result = await authController.signInWithEmail(
      _signInEmailController.text.trim(),
      _signInPasswordController.text,
    );

    if (mounted) {
      result.when(
        success: (user, message) {
          // Navigation handled by auth state listener
        },
        error: (exception) {
          // Error handled by ErrorService in provider
        },
        requiresAction: (actionType, data, message) {
          // Email verification required - handled by auth state listener
        },
      );
    }
  }

  Future<void> _signUp() async {
    if (!_signUpFormKey.currentState!.validate()) return;

    final authController = ref.read(authControllerProvider);
    final result = await authController.signUpWithEmail(
      _signUpEmailController.text.trim(),
      _signUpPasswordController.text,
      _signUpNameController.text.trim(),
    );

    if (mounted) {
      result.when(
        success: (user, message) {
          // Navigation handled by auth state listener
        },
        error: (exception) {
          // Error handled by ErrorService in provider
        },
        requiresAction: (actionType, data, message) {
          // Email verification required - handled by auth state listener
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: l10n.signIn),
            Tab(text: l10n.signUp),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildSignInTab(context, l10n, theme),
          _buildSignUpTab(context, l10n, theme),
        ],
      ),
    ).withSmoothLoading(
      isLoading: isLoading,
      message: loadingMessage,
    );
  }

  Widget _buildSignInTab(BuildContext context, AppLocalizations l10n, ThemeData theme) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppConstants.defaultPadding.w),
      child: Form(
        key: _signInFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.h),
            Text(
              l10n.welcomeBack,
              style: theme.textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              l10n.signInToYourAccount,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.textTheme.bodySmall?.color,
              ),
            ),
            SizedBox(height: 32.h),
            CustomTextField(
              controller: _signInEmailController,
              label: l10n.email,
              hint: l10n.enterYourEmail,
              prefixIcon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return l10n.emailRequired;
                }
                if (!RegExp(r'^[\w\.-]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                  return l10n.validEmailRequired;
                }
                return null;
              },
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              controller: _signInPasswordController,
              label: l10n.password,
              hint: l10n.enterYourPassword,
              prefixIcon: Icons.lock_outline,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return l10n.passwordRequired;
                }
                return null;
              },
            ),
            SizedBox(height: 16.h),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => context.push('/forgot-password'),
                child: Text(l10n.forgotPassword),
              ),
            ),
            SizedBox(height: 24.h),
            CustomButton(
              text: l10n.signIn,
              onPressed: _signIn,
              isLoading: _isLoading,
            ),
            SizedBox(height: 24.h),
            _buildSocialSignIn(theme),
          ],
        ),
      ),
    );
  }

  Widget _buildSignUpTab(BuildContext context, AppLocalizations l10n, ThemeData theme) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppConstants.defaultPadding.w),
      child: Form(
        key: _signUpFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.h),
            Text(
              l10n.createAccount,
              style: theme.textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              l10n.signUpToGetStarted,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.textTheme.bodySmall?.color,
              ),
            ),
            SizedBox(height: 32.h),
            CustomTextField(
              controller: _signUpNameController,
              label: l10n.fullName,
              hint: l10n.enterYourFullName,
              prefixIcon: Icons.person_outline,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return l10n.fullNameRequired;
                }
                return null;
              },
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              controller: _signUpEmailController,
              label: l10n.email,
              hint: l10n.enterYourEmail,
              prefixIcon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return l10n.emailRequired;
                }
                if (!RegExp(r'^[\w\.-]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                  return l10n.validEmailRequired;
                }
                return null;
              },
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              controller: _signUpPasswordController,
              label: l10n.password,
              hint: l10n.enterYourPassword,
              prefixIcon: Icons.lock_outline,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return l10n.passwordRequired;
                }
                if (value.length < AppConstants.minPasswordLength) {
                  return l10n.passwordTooShort;
                }
                return null;
              },
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              controller: _confirmPasswordController,
              label: l10n.confirmPassword,
              hint: l10n.confirmYourPassword,
              prefixIcon: Icons.lock_outline,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return l10n.confirmPasswordRequired;
                }
                if (value != _signUpPasswordController.text) {
                  return l10n.passwordsDoNotMatch;
                }
                return null;
              },
            ),
            SizedBox(height: 24.h),
            RichText(
              text: TextSpan(
                style: theme.textTheme.bodySmall,
                children: [
                  TextSpan(text: l10n.bySigningUpYouAgree),
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
            SizedBox(height: 24.h),
            CustomButton(
              text: l10n.signUp,
              onPressed: _signUp,
              isLoading: _isLoading,
            ),
            SizedBox(height: 24.h),
            _buildSocialSignIn(theme),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialSignIn(ThemeData theme) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'or continue with',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.textTheme.bodySmall?.color,
                ),
              ),
            ),
            const Expanded(child: Divider()),
          ],
        ),
        SizedBox(height: 24.h),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () async {
                  try {
                    setState(() => _isLoading = true);
                    await ref.read(authProvider.notifier).signInWithGoogle();
                  } catch (e) {
                    if (mounted) {
                      _showError(e.toString());
                    }
                  } finally {
                    if (mounted) {
                      setState(() => _isLoading = false);
                    }
                  }
                },
                icon: Icon(Icons.g_mobiledata, color: Colors.red, size: 24.w),
                label: const Text('Google'),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () async {
                  try {
                    setState(() => _isLoading = true);
                    await ref.read(authProvider.notifier).signInWithFacebook();
                  } catch (e) {
                    if (mounted) {
                      _showError(e.toString());
                    }
                  } finally {
                    if (mounted) {
                      setState(() => _isLoading = false);
                    }
                  }
                },
                icon: Icon(Icons.facebook, color: Colors.blue, size: 24.w),
                label: const Text('Facebook'),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
