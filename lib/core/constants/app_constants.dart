// lib/core/utils/app_constants.dart
import 'package:flutter/material.dart';

class AppConstants {
  // App Info
  static const String appName = 'LocalMarket';
  static const String appVersion = '1.0.0';

  // Supported Languages
  static const String defaultLanguage = 'en';
  static const List<Locale> supportedLocales = [
    Locale('en', ''),
    Locale('si', ''), // Sinhala
  ];

  // API & Firebase
  static const String baseUrl = 'https://api.localmarket.lk';
  static const int apiTimeoutDuration = 30000; // 30 seconds

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 50;

  // Image & Media
  static const int maxImageSize = 5 * 1024 * 1024; // 5MB
  static const List<String> allowedImageTypes = ['jpg', 'jpeg', 'png', 'webp'];
  static const int imageQuality = 80;

  // OTP
  static const int otpLength = 6;
  static const int otpTimeoutSeconds = 60;

  // Phone Number
  static const String defaultCountryCode = '+94';
  static const String countryCode = 'LK';

  // Cache
  static const Duration cacheValidDuration = Duration(hours: 1);
  static const Duration imageCacheDuration = Duration(days: 7);

  // Animation Durations
  static const Duration shortAnimationDuration = Duration(milliseconds: 200);
  static const Duration mediumAnimationDuration = Duration(milliseconds: 300);
  static const Duration longAnimationDuration = Duration(milliseconds: 500);

  // UI Dimensions
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double borderRadius = 12.0;
  static const double smallBorderRadius = 8.0;
  static const double largeBorderRadius = 16.0;

  // Product Grid
  static const int productsGridCrossAxisCount = 2;
  static const double productCardAspectRatio = 0.75;

  // Order Status
  static const List<String> orderStatuses = [
    'pending',
    'confirmed',
    'processing',
    'ready',
    'shipped',
    'delivered',
    'cancelled',
    'refunded',
  ];

  // Error Messages
  static const String genericErrorMessage = 'Something went wrong. Please try again.';
  static const String networkErrorMessage = 'Please check your internet connection and try again.';
  static const String timeoutErrorMessage = 'Request timed out. Please try again.';

  // Success Messages
  static const String orderPlacedMessage = 'Your order has been placed successfully!';
  static const String profileUpdatedMessage = 'Profile updated successfully!';

  // Validation
  static const int minPasswordLength = 6;
  static const int maxProductNameLength = 100;
  static const int maxDescriptionLength = 1000;
  static const int minSearchQueryLength = 2;

  // Hive Boxes
  static const String userPreferencesBox = 'user_preferences';
  static const String cacheBox = 'cache';
  static const String cartBox = 'cart';

  // SharedPreferences Keys
  static const String languageKey = 'language';
  static const String themeKey = 'theme';
  static const String isFirstLaunchKey = 'is_first_launch';
  static const String fcmTokenKey = 'fcm_token';
}

