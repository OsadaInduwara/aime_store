// lib/features/splash/screens/splash_screen.dart - FIXED VERSION
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/providers/auth_provider.dart';
import '../../../core/utils/app_constants.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _checkAuthStatus();
  }

  void _setupAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.6, curve: Curves.elasticOut),
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _checkAuthStatus() async {
    // Wait for animations and minimum splash time
    await Future.wait([
      _animationController.forward(),
      Future.delayed(const Duration(seconds: 2)),
    ]);

    if (!mounted) return;

    try {
      // Check Firebase Auth state
      final currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        // User is signed in
        if (currentUser.emailVerified || currentUser.phoneNumber != null) {
          // User has verified email or signed in with phone
          final authState = ref.read(authProvider);

          // Wait for auth provider to load user data
          await Future.delayed(const Duration(milliseconds: 500));

          if (mounted) {
            final user = ref.read(authProvider).value;
            if (user != null) {
              // Check if user profile is complete
              if (user.displayName.isEmpty || user.displayName == 'User') {
                context.go('/user-setup');
              } else {
                context.go('/home');
              }
            } else {
              // User data not loaded, go to setup
              context.go('/user-setup');
            }
          }
        } else {
          // User needs email verification
          context.go('/email-verification');
        }
      } else {
        // No user signed in
        context.go('/auth-selection');
      }
    } catch (e) {
      // Error during auth check, go to auth selection
      if (mounted) {
        context.go('/auth-selection');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // App Logo
                    Container(
                      width: 120.w,
                      height: 120.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.shopping_bag,
                        size: 60.w,
                        color: theme.primaryColor,
                      ),
                    ),

                    SizedBox(height: 24.h),

                    // App Name
                    Text(
                      AppConstants.appName,
                      style: theme.textTheme.displayMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 8.h),

                    // Tagline
                    Text(
                      'Your Local Marketplace',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),

                    SizedBox(height: 40.h),

                    // Loading Indicator
                    SizedBox(
                      width: 32.w,
                      height: 32.w,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.white.withOpacity(0.8),
                        ),
                        strokeWidth: 2,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}