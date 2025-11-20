// lib/features/cart/presentation/providers/cart_error_handler.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/error_service.dart';
import '../../../../core/exceptions/app_exceptions.dart';

/// Cart feature-specific error handler
class CartErrorHandler {
  static final CartErrorHandler _instance = CartErrorHandler._internal();
  factory CartErrorHandler() => _instance;
  CartErrorHandler._internal();

  /// Handle cart-specific errors
  Future<void> handleCartError(
    dynamic error, {
    BuildContext? context,
    VoidCallback? onRetry,
    CartErrorType? errorType,
  }) async {
    final errorService = ErrorService();

    String? customMessage;

    // Provide context-specific error messages
    switch (errorType) {
      case CartErrorType.addItem:
        customMessage = 'Failed to add item to cart. Please try again';
        break;
      case CartErrorType.removeItem:
        customMessage = 'Failed to remove item from cart. Please try again';
        break;
      case CartErrorType.updateQuantity:
        customMessage = 'Failed to update quantity. Please try again';
        break;
      case CartErrorType.loadCart:
        customMessage = 'Failed to load your cart. Please refresh';
        break;
      case CartErrorType.clearCart:
        customMessage = 'Failed to clear cart. Please try again';
        break;
      case CartErrorType.checkout:
        customMessage = 'Checkout failed. Please verify your information and try again';
        break;
      case null:
        if (error is NetworkException) {
          customMessage = 'Network error. Please check your connection';
        }
        break;
    }

    await errorService.handleError(
      error,
      context: context,
      customMessage: customMessage,
      onRetry: onRetry,
    );

    // Log specific error
    if (errorType != null) {
      _logCartError(errorType, error);
    }
  }

  void _logCartError(CartErrorType errorType, dynamic error) {
    debugPrint('Cart Error [${errorType.name}]: $error');
  }
}

/// Provider for cart error handler
final cartErrorHandlerProvider = Provider<CartErrorHandler>(
  (ref) => CartErrorHandler(),
);

/// Types of cart-related errors
enum CartErrorType {
  addItem,
  removeItem,
  updateQuantity,
  loadCart,
  clearCart,
  checkout,
}
