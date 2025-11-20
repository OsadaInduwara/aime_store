// lib/features/home/presentation/providers/home_error_handler.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/error_service.dart';
import '../../../../core/exceptions/app_exceptions.dart';

/// Home feature-specific error handler
class HomeErrorHandler {
  static final HomeErrorHandler _instance = HomeErrorHandler._internal();
  factory HomeErrorHandler() => _instance;
  HomeErrorHandler._internal();

  /// Handle home-specific errors
  Future<void> handleHomeError(
    dynamic error, {
    BuildContext? context,
    VoidCallback? onRetry,
    HomeErrorType? errorType,
  }) async {
    final errorService = ErrorService();

    String? customMessage;

    // Provide context-specific error messages
    if (error is NetworkException) {
      customMessage = 'Unable to load content. Please check your internet connection';
    } else if (error is DataException) {
      switch (errorType) {
        case HomeErrorType.productsLoading:
          customMessage = 'Failed to load products. Pull to refresh or try again';
          break;
        case HomeErrorType.categoriesLoading:
          customMessage = 'Failed to load categories. Please try again';
          break;
        case HomeErrorType.bannersLoading:
          customMessage = 'Failed to load promotions. Continue browsing products';
          break;
        case HomeErrorType.storesLoading:
          customMessage = 'Failed to load stores. Please try again';
          break;
        default:
          customMessage = 'Failed to load content. Please try again';
      }
    }

    await errorService.handleError(
      error,
      context: context,
      customMessage: customMessage,
      onRetry: onRetry,
      showSnackbar: errorType != HomeErrorType.bannersLoading, // Don't show for non-critical errors
    );

    // Log specific error for analytics
    if (errorType != null) {
      _logHomeError(errorType, error);
    }
  }

  void _logHomeError(HomeErrorType errorType, dynamic error) {
    debugPrint('Home Error [${errorType.name}]: $error');
  }
}

/// Provider for home error handler
final homeErrorHandlerProvider = Provider<HomeErrorHandler>(
  (ref) => HomeErrorHandler(),
);

/// Types of home-related errors
enum HomeErrorType {
  productsLoading,
  categoriesLoading,
  bannersLoading,
  storesLoading,
  search,
  navigation,
}
