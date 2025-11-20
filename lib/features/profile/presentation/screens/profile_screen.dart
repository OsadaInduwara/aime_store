// lib/features/profile/screens/profile_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/presentation/providers/auth_provider.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../l10n/app_localizations.dart';
import '../../vendor/presentation/providers/store_provider.dart';
import '../../../../core/data/models/user_model.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.profile),
        centerTitle: true,
      ),
      body: authState.when(
        data: (user) {
          if (user == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Please sign in to view profile'),
                  ElevatedButton(
                    onPressed: () => context.go('/auth-selection'),
                    child: Text('Sign In'),
                  ),
                ],
              ),
            );
          }

          return SingleChildScrollView(
            padding: EdgeInsets.all(AppConstants.defaultPadding.w),
            child: Column(
              children: [
                // Profile Header
                Container(
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: theme.cardColor,
                    borderRadius: BorderRadius.circular(AppConstants.borderRadius.r),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40.r,
                        backgroundImage: user.profileImage != null
                            ? NetworkImage(user.profileImage!)
                            : null,
                        child: user.profileImage == null
                            ? Icon(Icons.person, size: 40.w)
                            : null,
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.displayName,
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            if (user.email != null)
                              Text(
                                user.email!,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.textTheme.bodySmall?.color,
                                ),
                              ),
                            Text(
                              user.phoneNumber,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.textTheme.bodySmall?.color,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () => context.push('/edit-profile'),
                        icon: const Icon(Icons.edit),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24.h),

                // Vendor Section
                _buildVendorSection(context, user),

                // Menu Items
                _ProfileMenuItem(
                  icon: Icons.shopping_bag_outlined,
                  title: 'My Orders',
                  onTap: () => context.push('/orders'),
                ),
                _ProfileMenuItem(
                  icon: Icons.favorite_outline,
                  title: 'Wishlist',
                  onTap: () => context.push('/wishlist'),
                ),
                _ProfileMenuItem(
                  icon: Icons.location_on_outlined,
                  title: 'Addresses',
                  onTap: () => context.push('/addresses'),
                ),
                _ProfileMenuItem(
                  icon: Icons.payment_outlined,
                  title: 'Payment Methods',
                  onTap: () => context.push('/payment-methods'),
                ),
                _ProfileMenuItem(
                  icon: Icons.notifications_outlined,
                  title: 'Notifications',
                  onTap: () => context.push('/notification-settings'),
                ),
                _ProfileMenuItem(
                  icon: Icons.language_outlined,
                  title: 'Language',
                  onTap: () => context.push('/language-settings'),
                ),
                _ProfileMenuItem(
                  icon: Icons.help_outline,
                  title: 'Help & Support',
                  onTap: () => context.push('/help'),
                ),
                _ProfileMenuItem(
                  icon: Icons.info_outline,
                  title: 'About',
                  onTap: () => context.push('/about'),
                ),

                SizedBox(height: 24.h),

                // Sign Out Button
                Container(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => _showSignOutDialog(context, ref),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.red,
                      side: const BorderSide(color: Colors.red),
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.logout, size: 20.w),
                        SizedBox(width: 8.w),
                        Text('Sign Out'),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 40.h),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text('Error loading profile'),
        ),
      ),
    );
  }

  void _showSignOutDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await ref.read(authProvider.notifier).signOut();
              if (context.mounted) {
                context.go('/auth-selection');
              }
            },
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }

  Widget _buildVendorSection(BuildContext context, dynamic user) {
    final hasStoreAsync = ref.watch(hasStoreProvider);
    final userStoreAsync = ref.watch(userStoreProvider);

    return hasStoreAsync.when(
      data: (hasStore) {
        if (hasStore) {
          // User has a store - show vendor options
          return userStoreAsync.when(
            data: (store) {
              if (store != null) {
                return Column(
                  children: [
                    // Store info card
                    Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.green[400]!, Colors.green[600]!],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(AppConstants.borderRadius.r),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Icon(
                              Icons.store,
                              color: Colors.white,
                              size: 24.w,
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Your Store',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  store.storeName,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (store.settings.isActive) ...[
                                  SizedBox(height: 4.h),
                                  Row(
                                    children: [
                                      Container(
                                        width: 8.w,
                                        height: 8.w,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      SizedBox(width: 6.w),
                                      Text(
                                        'Active',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ] else ...[
                                  SizedBox(height: 4.h),
                                  Row(
                                    children: [
                                      Container(
                                        width: 8.w,
                                        height: 8.w,
                                        decoration: BoxDecoration(
                                          color: Colors.orange[300],
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      SizedBox(width: 6.w),
                                      Text(
                                        'Inactive',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ],
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.white,
                            size: 24.w,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // Vendor menu items
                    _ProfileMenuItem(
                      icon: Icons.dashboard_outlined,
                      title: 'Vendor Dashboard',
                      onTap: () => context.push('/vendor/products'),
                    ),
                    _ProfileMenuItem(
                      icon: Icons.add_box_outlined,
                      title: 'Add Product',
                      onTap: () => context.push('/vendor/product-listing'),
                    ),
                    _ProfileMenuItem(
                      icon: Icons.inventory_2_outlined,
                      title: 'Manage Products',
                      onTap: () => context.push('/vendor/products'),
                    ),
                    _ProfileMenuItem(
                      icon: Icons.store_outlined,
                      title: 'Store Settings',
                      onTap: () => context.push('/vendor/store-settings'),
                    ),

                    SizedBox(height: 16.h),
                  ],
                );
              } else {
                return const SizedBox.shrink();
              }
            },
            loading: () => const SizedBox.shrink(),
            error: (error, stackTrace) => const SizedBox.shrink(),
          );
        } else {
          // User doesn't have a store - show option to create one
          return Column(
            children: [
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue[400]!, Colors.blue[600]!],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(AppConstants.borderRadius.r),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Icon(
                        Icons.store_mall_directory_outlined,
                        color: Colors.white,
                        size: 24.w,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Become a Vendor',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'Create your store and start selling',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                      size: 24.w,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              GestureDetector(
                onTap: () => context.push('/store-setup'),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(AppConstants.borderRadius.r),
                    border: Border.all(color: Colors.blue[200]!),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_business,
                        color: Colors.blue[600],
                        size: 20.w,
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Text(
                          'Create Your Store',
                          style: TextStyle(
                            color: Colors.blue[600],
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.blue[600],
                        size: 16.w,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24.h),
            ],
          );
        }
      },
      loading: () => const SizedBox.shrink(),
      error: (error, stackTrace) => const SizedBox.shrink(),
    );
  }
}

class _ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _ProfileMenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      child: ListTile(
        leading: Icon(icon, color: theme.primaryColor),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius.r),
        ),
        tileColor: theme.cardColor,
      ),
    );
  }
}
