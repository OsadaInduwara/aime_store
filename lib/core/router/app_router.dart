// lib/core/router/app_router.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../presentation/providers/auth_provider.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../features/auth/presentation/screens/auth_selection_screen.dart';
import '../../features/auth/presentation/screens/phone_auth_screen.dart';
import '../../features/auth/presentation/screens/otp_verification_screen.dart';
import '../../features/auth/presentation/screens/email_auth_screen.dart';
import '../../features/auth/presentation/screens/email_verification_screen.dart';
import '../../features/auth/presentation/screens/forgot_password_screen.dart';
import '../../features/auth/presentation/screens/user_setup_screen.dart';
import '../../features/vendor/presentation/screens/store_setup_screen.dart';
import '../../features/home/presentation/screens/main_navigation_screen.dart';
import '../../features/products/presentation/screens/product_detail_screen.dart';
import '../../features/categories/presentation/screens/categories_screen.dart';
import '../../features/category_products/presentation/screens/category_products_screen.dart';
import '../../features/cart/presentation/screens/cart_screen.dart';
import '../../features/checkout/presentation/screens/checkout_screen.dart';
import '../../features/orders/presentation/screens/order_success_screen.dart';
import '../../features/orders/presentation/screens/orders_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import '../../features/addresses/presentation/screens/addresses_screen.dart';
import '../../features/addresses/presentation/screens/add_edit_address_screen.dart';
import '../../features/wishlist/presentation/screens/wishlist_screen.dart';
import '../../features/search/presentation/screens/search_screen.dart';
import '../../features/notifications/presentation/screens/notifications_screen.dart';
import '../../features/settings/presentation/screens/settings_screen.dart';
import '../../features/store_detail/presentation/screens/store_detail_screen.dart';
import '../../features/not_found/presentation/screens/not_found_screen.dart';
import '../../features/vendor/presentation/screens/product_listing_screen.dart';
import '../../features/vendor/presentation/screens/vendor_products_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/splash',
    redirect: (context, state) {
      final currentUser = FirebaseAuth.instance.currentUser;
      final location = state.matchedLocation;

      // Always allow splash screen
      if (location == '/splash') {
        return null;
      }

      // Handle authentication state
      if (currentUser == null) {
        // User not authenticated - redirect to auth routes
        if (!_isAuthRoute(location)) {
          return '/auth-selection';
        }
        return null;
      } else {
        // User is authenticated
        final authState = ref.read(authProvider);

        // Check if user needs email verification
        if (currentUser.email != null && !currentUser.emailVerified) {
          if (location != '/email-verification') {
            return '/email-verification';
          }
          return null;
        }

        // Check if user needs profile setup
        if (authState.hasValue) {
          final user = authState.value;
          if (user != null) {
            // Check if user profile is incomplete
            if (_needsProfileSetup(user) && location != '/user-setup') {
              return '/user-setup';
            }
          }
        }

        // Redirect away from auth routes if already authenticated and setup
        if (_isAuthRoute(location) && !_needsSetup(authState)) {
          return '/home';
        }
      }

      return null;
    },
    routes: [
      // Splash
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),

      // Authentication Routes
      GoRoute(
        path: '/auth-selection',
        builder: (context, state) => const AuthSelectionScreen(),
      ),
      GoRoute(
        path: '/phone-auth',
        builder: (context, state) => const PhoneAuthScreen(),
      ),
      GoRoute(
        path: '/otp-verification',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return OTPVerificationScreen(
            phoneNumber: extra?['phoneNumber'] ?? '',
            verificationId: extra?['verificationId'] ?? '',
          );
        },
      ),
      GoRoute(
        path: '/email-auth',
        builder: (context, state) => const EmailAuthScreen(),
      ),
      GoRoute(
        path: '/email-verification',
        builder: (context, state) => const EmailVerificationScreen(),
      ),
      GoRoute(
        path: '/forgot-password',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: '/user-setup',
        builder: (context, state) => const UserSetupScreen(),
      ),
      GoRoute(
        path: '/store-setup',
        builder: (context, state) => const StoreSetupScreen(),
      ),

      // Main App Routes
      GoRoute(
        path: '/home',
        builder: (context, state) => const MainNavigationScreen(),
      ),

      // Product Routes
      GoRoute(
        path: '/product/:id',
        builder: (context, state) => ProductDetailScreen(
          productId: state.pathParameters['id']!,
        ),
      ),

      // Category Routes
      GoRoute(
        path: '/categories',
        builder: (context, state) => const CategoriesScreen(),
      ),
      GoRoute(
        path: '/category/:id',
        builder: (context, state) => CategoryProductsScreen(
          categoryId: state.pathParameters['id']!,
        ),
      ),

      // Store Routes
      GoRoute(
        path: '/store/:id',
        builder: (context, state) => StoreDetailScreen(
          storeId: state.pathParameters['id']!,
        ),
      ),

      // Cart & Checkout Routes
      GoRoute(
        path: '/cart',
        builder: (context, state) => const CartScreen(),
      ),
      GoRoute(
        path: '/checkout',
        builder: (context, state) => const CheckoutScreen(),
      ),
      GoRoute(
        path: '/order-success',
        builder: (context, state) {
          final orderNumber = state.uri.queryParameters['orderNumber'];
          return OrderSuccessScreen(orderNumber: orderNumber);
        },
      ),

      // Order Routes
      GoRoute(
        path: '/orders',
        builder: (context, state) => const OrdersScreen(),
      ),

      // Profile Routes
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfileScreen(),
      ),

      // Address Routes
      GoRoute(
        path: '/addresses',
        builder: (context, state) => const AddressesScreen(),
      ),
      GoRoute(
        path: '/add-address',
        builder: (context, state) => const AddEditAddressScreen(),
      ),
      GoRoute(
        path: '/edit-address/:id',
        builder: (context, state) => AddEditAddressScreen(
          addressId: state.pathParameters['id'],
        ),
      ),

      // Other Routes
      GoRoute(
        path: '/wishlist',
        builder: (context, state) => const WishlistScreen(),
      ),
      GoRoute(
        path: '/search',
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        path: '/notifications',
        builder: (context, state) => const NotificationsScreen(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),

      // Vendor Routes
      GoRoute(
        path: '/vendor/products',
        builder: (context, state) => const VendorProductsScreen(),
      ),
      GoRoute(
        path: '/vendor/product-listing',
        builder: (context, state) => const ProductListingScreen(),
      ),
      GoRoute(
        path: '/vendor/product-listing/:id',
        builder: (context, state) {
          final productId = state.pathParameters['id'];
          return ProductListingScreen(productId: productId);
        },
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
});

bool _isAuthRoute(String route) {
  final authRoutes = [
    '/auth-selection',
    '/phone-auth',
    '/otp-verification',
    '/email-auth',
    '/email-verification',
    '/forgot-password',
    '/user-setup',
    '/store-setup',
  ];
  return authRoutes.contains(route);
}

bool _needsProfileSetup(dynamic user) {
  if (user == null) return true;

  // Check if display name is empty or default
  final displayName = user.displayName ?? '';
  return displayName.isEmpty || displayName == 'User';
}

bool _needsSetup(AsyncValue authState) {
  if (authState.isLoading) return true;
  if (!authState.hasValue) return true;

  final user = authState.value;
  return _needsProfileSetup(user);
}
