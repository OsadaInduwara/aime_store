// lib/features/splash/screens/splash_screen.dart - FIXED VERSION
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/presentation/providers/auth_provider.dart';
import '../../../../core/constants/app_constants.dart';

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
    _initializeApp();
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

  Future<void> _initializeApp() async {
    // Start animations
    _animationController.forward();

    // Wait for minimum splash time and auth state to load
    await Future.wait([
      Future.delayed(const Duration(seconds: 2)),
      _waitForAuthState(),
    ]);

    if (mounted) {
      _navigateToNextScreen();
    }
  }

  Future<void> _waitForAuthState() async {
    // Wait for auth provider to initialize
    int attempts = 0;
    const maxAttempts = 20; // 10 seconds max wait

    while (attempts < maxAttempts) {
      final authState = ref.read(authProvider);
      if (!authState.isLoading) {
        break;
      }
      await Future.delayed(const Duration(milliseconds: 500));
      attempts++;
    }
  }

  void _navigateToNextScreen() {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser == null) {
        // No user signed in
        context.go('/auth-selection');
        return;
      }

      // User is signed in, check verification and profile status
      if (currentUser.email != null && !currentUser.emailVerified) {
        // Email not verified
        context.go('/email-verification');
        return;
      }

      // Check if user profile needs setup
      final authState = ref.read(authProvider);
      final user = authState.maybeWhen(
        authenticated: (user) => user,
        profileSetupRequired: (user) => user,
        orElse: () => null,
      );
      
      if (user == null || _needsProfileSetup(user)) {
        context.go('/user-setup');
        return;
      }

      // Check if vendor needs store setup
      if (user.userType.name == 'vendor') {
        // Additional vendor setup checks can be added here
        // For now, go to home
        context.go('/home');
        return;
      }

      // User is fully set up
      context.go('/home');
    } catch (e) {
      // Error during navigation check, go to auth selection
      debugPrint('Splash navigation error: $e');
      context.go('/auth-selection');
    }
  }

  bool _needsProfileSetup(dynamic user) {
    if (user == null) return true;

    final displayName = user.displayName ?? '';
    return displayName.isEmpty || displayName == 'User';
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
