// lib/core/presentation/providers/global_loading_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'global_loading_provider.freezed.dart';
part 'global_loading_provider.g.dart';

/// Global loading state with contextual messages
@freezed
class LoadingState with _$LoadingState {
  const factory LoadingState({
    @Default(false) bool isLoading,
    @Default('') String message,
    @Default('') String operation,
    @Default(0.0) double progress,
    @Default(false) bool showProgress,
  }) = _LoadingState;
}

/// Global loading provider for managing app-wide loading states
@riverpod
class GlobalLoading extends _$GlobalLoading {
  @override
  LoadingState build() {
    return const LoadingState();
  }

  /// Show loading with a message
  void show(String message, {String operation = '', bool showProgress = false}) {
    state = state.copyWith(
      isLoading: true,
      message: message,
      operation: operation,
      showProgress: showProgress,
      progress: 0.0,
    );
  }

  /// Update loading progress (0.0 to 1.0)
  void updateProgress(double progress, {String? message}) {
    if (state.isLoading) {
      state = state.copyWith(
        progress: progress.clamp(0.0, 1.0),
        message: message ?? state.message,
      );
    }
  }

  /// Update loading message without changing other states
  void updateMessage(String message) {
    if (state.isLoading) {
      state = state.copyWith(message: message);
    }
  }

  /// Hide loading
  void hide() {
    state = const LoadingState();
  }

  /// Show loading for authentication operations
  void showAuth(String operation) {
    final messages = {
      'signin': 'Signing you in...',
      'signup': 'Creating your account...',
      'logout': 'Signing you out...',
      'verify_phone': 'Verifying phone number...',
      'verify_email': 'Verifying email...',
      'send_otp': 'Sending verification code...',
      'reset_password': 'Sending reset email...',
      'google_signin': 'Signing in with Google...',
      'facebook_signin': 'Signing in with Facebook...',
      'profile_setup': 'Setting up your profile...',
    };

    show(messages[operation] ?? 'Processing...', operation: 'auth');
  }

  /// Show loading for product operations
  void showProduct(String operation) {
    final messages = {
      'loading_products': 'Loading products...',
      'loading_details': 'Loading product details...',
      'adding_to_cart': 'Adding to cart...',
      'removing_from_cart': 'Removing from cart...',
      'updating_cart': 'Updating cart...',
      'adding_to_wishlist': 'Adding to wishlist...',
      'removing_from_wishlist': 'Removing from wishlist...',
      'searching': 'Searching products...',
      'loading_recommendations': 'Finding products you might like...',
    };

    show(messages[operation] ?? 'Loading...', operation: 'product');
  }

  /// Show loading for order operations
  void showOrder(String operation) {
    final messages = {
      'placing_order': 'Placing your order...',
      'loading_orders': 'Loading your orders...',
      'cancelling_order': 'Cancelling order...',
      'updating_order': 'Updating order...',
      'loading_checkout': 'Preparing checkout...',
      'processing_payment': 'Processing payment...',
    };

    show(messages[operation] ?? 'Processing...', operation: 'order');
  }

  /// Show loading for store operations
  void showStore(String operation) {
    final messages = {
      'loading_stores': 'Loading stores...',
      'loading_store_details': 'Loading store information...',
      'creating_store': 'Creating your store...',
      'updating_store': 'Updating store information...',
      'uploading_image': 'Uploading image...',
      'uploading_video': 'Uploading video...',
    };

    show(messages[operation] ?? 'Loading...', operation: 'store');
  }

  /// Show loading for file operations with progress
  void showFileOperation(String operation, {bool showProgress = true}) {
    final messages = {
      'uploading': 'Uploading file...',
      'downloading': 'Downloading file...',
      'compressing': 'Compressing image...',
      'processing': 'Processing file...',
    };

    show(
      messages[operation] ?? 'Processing file...',
      operation: 'file',
      showProgress: showProgress,
    );
  }

  /// Show loading for data sync operations
  void showSync(String operation) {
    final messages = {
      'syncing': 'Syncing data...',
      'backing_up': 'Backing up data...',
      'restoring': 'Restoring data...',
      'updating_cache': 'Updating cache...',
    };

    show(messages[operation] ?? 'Syncing...', operation: 'sync');
  }
}

/// Helper extensions for common loading patterns
extension LoadingOperations on GlobalLoading {
  /// Execute an async operation with loading
  Future<T> withLoading<T>(
    String message,
    Future<T> Function() operation, {
    String operationType = '',
    bool showProgress = false,
  }) async {
    try {
      show(message, operation: operationType, showProgress: showProgress);
      return await operation();
    } finally {
      hide();
    }
  }

  /// Execute an async operation with progress updates
  Future<T> withProgress<T>(
    String message,
    Future<T> Function(void Function(double) updateProgress) operation, {
    String operationType = '',
  }) async {
    try {
      show(message, operation: operationType, showProgress: true);

      return await operation((progress) {
        updateProgress(progress);
      });
    } finally {
      hide();
    }
  }

  /// Execute an async operation with auth loading
  Future<T> withAuthLoading<T>(
    String operation,
    Future<T> Function() asyncOperation,
  ) async {
    try {
      showAuth(operation);
      return await asyncOperation();
    } finally {
      hide();
    }
  }

  /// Execute an async operation with product loading
  Future<T> withProductLoading<T>(
    String operation,
    Future<T> Function() asyncOperation,
  ) async {
    try {
      showProduct(operation);
      return await asyncOperation();
    } finally {
      hide();
    }
  }

  /// Execute an async operation with order loading
  Future<T> withOrderLoading<T>(
    String operation,
    Future<T> Function() asyncOperation,
  ) async {
    try {
      showOrder(operation);
      return await asyncOperation();
    } finally {
      hide();
    }
  }
}