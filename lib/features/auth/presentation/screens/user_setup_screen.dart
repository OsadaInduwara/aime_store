// lib/features/authentication/screens/user_setup_screen.dart - FIXED VERSION
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

import '../../../../core/presentation/providers/auth_provider.dart';
import '../../../../core/data/models/user_model.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/presentation/widgets/custom_button.dart';
import '../../../../core/presentation/widgets/custom_text_field.dart';
import '../../../../core/presentation/widgets/loading_overlay.dart';
import '../../../../core/presentation/widgets/profile_image_picker.dart';
import '../../../../l10n/app_localizations.dart';

class UserSetupScreen extends ConsumerStatefulWidget {
  const UserSetupScreen({super.key});

  @override
  ConsumerState<UserSetupScreen> createState() => _UserSetupScreenState();
}

class _UserSetupScreenState extends ConsumerState<UserSetupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  File? _profileImage;
  UserType _selectedUserType = UserType.customer;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadExistingUserData();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _loadExistingUserData() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      _nameController.text = currentUser.displayName ?? '';
      _emailController.text = currentUser.email ?? '';
    }

    // Load from auth provider if available
    final authState = ref.read(authProvider);
    final user = authState.maybeWhen(
      authenticated: (user) => user,
      profileSetupRequired: (user) => user,
      orElse: () => null,
    );
    
    if (user != null) {
      _nameController.text = user.displayName;
      if (user.email != null) {
        _emailController.text = user.email!;
      }
      _selectedUserType = user.userType;
    }
  }

  Future<void> _completeSetup() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final currentFirebaseUser = FirebaseAuth.instance.currentUser;
      if (currentFirebaseUser == null) {
        throw Exception('No user found');
      }

      debugPrint('Completing setup for user: ${currentFirebaseUser.uid}');

      // Update Firebase Auth profile if needed
      if (currentFirebaseUser.displayName != _nameController.text.trim()) {
        await currentFirebaseUser.updateDisplayName(_nameController.text.trim());
        debugPrint('Updated Firebase Auth display name');
      }

      // Create or update user document in Firestore
      final authNotifier = ref.read(authProvider.notifier);
      final existingUser = ref.read(authProvider).maybeWhen(
        authenticated: (user) => user,
        profileSetupRequired: (user) => user,
        orElse: () => null,
      );

      UserModel updatedUser;
      final now = DateTime.now();

      if (existingUser != null) {
        // Update existing user
        updatedUser = existingUser.copyWith(
          displayName: _nameController.text.trim(),
          email: _emailController.text.trim().isEmpty
              ? existingUser.email
              : _emailController.text.trim(),
          userType: _selectedUserType,
          updatedAt: now,
        );
        debugPrint('Updating existing user profile');
      } else {
        // Create new user
        updatedUser = UserModel(
          id: currentFirebaseUser.uid,
          phoneNumber: currentFirebaseUser.phoneNumber ?? '',
          displayName: _nameController.text.trim(),
          email: _emailController.text.trim().isEmpty
              ? currentFirebaseUser.email
              : _emailController.text.trim(),
          profileImage: currentFirebaseUser.photoURL,
          userType: _selectedUserType,
          addresses: const [],
          preferences: const UserPreferences(
            language: 'en',
            currency: 'LKR',
            notifications: NotificationSettings(
              push: true,
              sms: true,
              email: true,
              orderUpdates: true,
              promotions: false,
            ),
          ),
          createdAt: now,
          updatedAt: now,
        );
        debugPrint('Creating new user profile');
      }

      await authNotifier.updateProfile(updatedUser);
      debugPrint('Profile saved successfully');

      if (mounted) {
        if (_selectedUserType == UserType.vendor) {
          debugPrint('Navigating to store setup');
          context.go('/store-setup');
        } else {
          debugPrint('Navigating to home');
          context.go('/home');
        }
      }
    } catch (e) {
      debugPrint('Setup completion error: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to complete setup: $e'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 4),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _skipSetup() async {
    setState(() => _isLoading = true);

    try {
      final currentFirebaseUser = FirebaseAuth.instance.currentUser;
      if (currentFirebaseUser == null) {
        throw Exception('No user found');
      }

      debugPrint('Skipping setup for user: ${currentFirebaseUser.uid}');

      // Create basic user profile with current Firebase data
      final authNotifier = ref.read(authProvider.notifier);
      final now = DateTime.now();

      final basicUser = UserModel(
        id: currentFirebaseUser.uid,
        phoneNumber: currentFirebaseUser.phoneNumber ?? '',
        displayName: currentFirebaseUser.displayName?.isNotEmpty == true
            ? currentFirebaseUser.displayName!
            : 'User',
        email: currentFirebaseUser.email,
        profileImage: currentFirebaseUser.photoURL,
        userType: UserType.customer,
        addresses: const [],
        preferences: const UserPreferences(
          language: 'en',
          currency: 'LKR',
          notifications: NotificationSettings(
            push: true,
            sms: true,
            email: true,
            orderUpdates: true,
            promotions: false,
          ),
        ),
        createdAt: now,
        updatedAt: now,
      );

      await authNotifier.updateProfile(basicUser);
      debugPrint('Basic profile created successfully');

      if (mounted) {
        debugPrint('Navigating to home after skip');
        context.go('/home');
      }
    } catch (e) {
      debugPrint('Skip setup error: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),

                  // Progress Indicator
                  LinearProgressIndicator(
                    value: 0.8,
                    backgroundColor: theme.dividerColor,
                    valueColor: AlwaysStoppedAnimation<Color>(theme.primaryColor),
                  ),

                  SizedBox(height: 32.h),

                  // Title
                  Text(
                    l10n.completeYourProfile,
                    style: theme.textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8.h),

                  Text(
                    l10n.helpUsKnowYouBetter,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.textTheme.bodySmall?.color,
                    ),
                  ),

                  SizedBox(height: 32.h),

                  // Profile Image
                  Center(
                    child: ProfileImagePicker(
                      onImageSelected: (image) {
                        setState(() => _profileImage = image);
                      },
                      initialImageUrl: FirebaseAuth.instance.currentUser?.photoURL,
                    ),
                  ),

                  SizedBox(height: 32.h),

                  // Full Name
                  CustomTextField(
                    controller: _nameController,
                    label: l10n.fullName,
                    hint: l10n.enterYourFullName,
                    prefixIcon: Icons.person_outline,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return l10n.fullNameRequired;
                      }
                      if (value.trim().length < 2) {
                        return 'Name must be at least 2 characters';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 16.h),

                  // Email (Optional)
                  CustomTextField(
                    controller: _emailController,
                    label: '${l10n.email} (${l10n.optional})',
                    hint: l10n.enterYourEmail,
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        if (!RegExp(r'^[\w\.-]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                          return l10n.validEmailRequired;
                        }
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 24.h),

                  // User Type Selection
                  Text(
                    l10n.iAmA,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: 12.h),

                  Row(
                    children: [
                      Expanded(
                        child: _UserTypeCard(
                          title: l10n.customer,
                          subtitle: l10n.buyProducts,
                          icon: Icons.shopping_bag_outlined,
                          isSelected: _selectedUserType == UserType.customer,
                          onTap: () => setState(() => _selectedUserType = UserType.customer),
                        ),
                      ),

                      SizedBox(width: 12.w),

                      Expanded(
                        child: _UserTypeCard(
                          title: l10n.seller,
                          subtitle: l10n.sellProducts,
                          icon: Icons.store_outlined,
                          isSelected: _selectedUserType == UserType.vendor,
                          onTap: () => setState(() => _selectedUserType = UserType.vendor),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 40.h),

                  // Continue Button
                  CustomButton(
                    text: l10n.continueText,
                    onPressed: _completeSetup,
                    isLoading: _isLoading,
                  ),

                  SizedBox(height: 16.h),

                  // Skip Button
                  Center(
                    child: TextButton(
                      onPressed: _isLoading ? null : _skipSetup,
                      child: Text(
                        'Skip for now',
                        style: TextStyle(
                          color: theme.textTheme.bodySmall?.color,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _UserTypeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _UserTypeCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: AppConstants.shortAnimationDuration,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: isSelected
              ? theme.primaryColor.withOpacity(0.1)
              : theme.cardColor,
          border: Border.all(
            color: isSelected
                ? theme.primaryColor
                : theme.dividerColor,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(AppConstants.borderRadius.r),
          boxShadow: isSelected ? [
            BoxShadow(
              color: theme.primaryColor.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ] : [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          children: [
            AnimatedContainer(
              duration: AppConstants.shortAnimationDuration,
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                color: isSelected
                    ? theme.primaryColor
                    : theme.primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: isSelected
                    ? Colors.white
                    : theme.primaryColor,
                size: 24.w,
              ),
            ),

            SizedBox(height: 12.h),

            Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? theme.primaryColor
                    : theme.textTheme.titleMedium?.color,
              ),
            ),

            SizedBox(height: 4.h),

            Text(
              subtitle,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.textTheme.bodySmall?.color,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
