// lib/core/router/app_router.dart - FIXED VERSION
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/auth_provider.dart';
import '../../features/splash/screens/splash_screen.dart';
import '../../features/authentication/screens/auth_selection_screen.dart';
import '../../features/authentication/screens/phone_auth_screen.dart';
import '../../features/authentication/screens/otp_verification_screen.dart';
import '../../features/authentication/screens/email_auth_screen.dart';
import '../../features/authentication/screens/email_verification_screen.dart';
import '../../features/authentication/screens/forgot_password_screen.dart';
import '../../features/authentication/screens/user_setup_screen.dart';
import '../../features/vendor/screens/store_setup_screen.dart';
import '../../features/home/screens/main_navigation_screen.dart';
import '../../features/products/screens/product_detail_screen.dart';
import '../../features/categories/screens/categories_screen.dart';
import '../../features/category_products/screens/category_products_screen.dart';
import '../../features/cart/screens/cart_screen.dart';
import '../../features/checkout/screens/checkout_screen.dart';
import '../../features/orders/screens/order_success_screen.dart';
import '../../features/orders/screens/orders_screen.dart';
import '../../features/profile/screens/profile_screen.dart';
import '../../features/addresses/screens/addresses_screen.dart';
import '../../features/addresses/screens/add_edit_address_screen.dart';
import '../../features/wishlist/screens/wishlist_screen.dart';
import '../../features/search/screens/search_screen.dart';
import '../../features/notifications/screens/notifications_screen.dart';
import '../../features/settings/screens/settings_screen.dart';
import '../../features/store_detail/screens/store_detail_screen.dart';
import '../../features/not_found/screens/not_found_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/splash',
    redirect: (context, state) {
      // Get auth state safely
      final authState = ref.read(authProvider);

      // Handle loading state
      if (authState.isLoading && state.matchedLocation == '/splash') {
        return null; // Stay on splash while loading
      }

      // Handle error state - redirect to auth selection
      if (authState.hasError) {
        if (state.matchedLocation != '/auth-selection' &&
            !_isAuthRoute(state.matchedLocation)) {
          return '/auth-selection';
        }
        return null;
      }

      // Handle auth state
      if (!authState.isLoading) {
        final isLoggedIn = authState.value != null;

        // If on splash screen and auth is loaded, redirect appropriately
        if (state.matchedLocation == '/splash') {
          return isLoggedIn ? '/home' : '/auth-selection';
        }

        // If not logged in and trying to access protected routes
        if (!isLoggedIn && _isProtectedRoute(state.matchedLocation)) {
          return '/auth-selection';
        }

        // If logged in but trying to access auth routes
        if (isLoggedIn && _isAuthRoute(state.matchedLocation)) {
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
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
});

bool _isProtectedRoute(String route) {
  final protectedRoutes = [
    '/home',
    '/cart',
    '/checkout',
    '/orders',
    '/profile',
    '/addresses',
    '/add-address',
    '/wishlist',
    '/notifications',
    '/settings',
  ];

  return protectedRoutes.any((protectedRoute) =>
      route.startsWith(protectedRoute));
}

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