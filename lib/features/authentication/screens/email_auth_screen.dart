// lib/features/authentication/screens/email_auth_screen.dart - FIXED VERSION
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/providers/auth_provider.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../core/widgets/loading_overlay.dart';
import '../../../l10n/app_localizations.dart';

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

  bool _isLoading = false;

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
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null && mounted && !_isLoading) {
        if (user.emailVerified) {
          _navigateBasedOnUserState();
        } else {
          // User needs email verification
          context.go('/email-verification');
        }
      }
    });
  }

  void _navigateBasedOnUserState() {
    final authState = ref.read(authProvider);
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

  Future<void> _signIn() async {
    if (!_signInFormKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _signInEmailController.text.trim(),
        password: _signInPasswordController.text,
      );

      if (credential.user != null && !credential.user!.emailVerified) {
        await FirebaseAuth.instance.signOut();
        if (mounted) {
          _showError('Please verify your email before signing in');
        }
      }
      // Navigation handled by auth listener
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        _showError(_getAuthErrorMessage(e.code));
      }
    } catch (e) {
      if (mounted) {
        _showError('Sign in failed: $e');
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _signUp() async {
    if (!_signUpFormKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _signUpEmailController.text.trim(),
        password: _signUpPasswordController.text,
      );

      if (credential.user != null) {
        // Update display name
        await credential.user!.updateDisplayName(_signUpNameController.text.trim());

        // Send email verification
        await credential.user!.sendEmailVerification();

        if (mounted) {
          context.go('/email-verification');
        }
      }
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        _showError(_getAuthErrorMessage(e.code));
      }
    } catch (e) {
      if (mounted) {
        _showError('Sign up failed: $e');
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

  String _getAuthErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'user-not-found':
        return 'No account found with this email address';
      case 'wrong-password':
        return 'Incorrect password';
      case 'email-already-in-use':
        return 'An account already exists with this email';
      case 'weak-password':
        return 'Password is too weak';
      case 'invalid-email':
        return 'Invalid email address';
      case 'user-disabled':
        return 'This account has been disabled';
      case 'too-many-requests':
        return 'Too many failed attempts. Please try again later';
      case 'operation-not-allowed':
        return 'Email/password sign in is not enabled';
      default:
        return 'Authentication failed. Please try again';
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
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: l10n.signIn),
            Tab(text: l10n.signUp),
          ],
        ),
      ),
      body: LoadingOverlay(
        isLoading: _isLoading,
        child: TabBarView(
          controller: _tabController,
          children: [
            _buildSignInTab(context, l10n, theme),
            _buildSignUpTab(context, l10n, theme),
          ],
        ),
      ),
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