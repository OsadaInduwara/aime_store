// lib/core/utils/async_helper.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../exceptions/app_exceptions.dart';
import '../presentation/providers/global_loading_provider.dart';
import '../presentation/providers/global_error_provider.dart';

/// Utility class for handling async operations with loading and error states
class AsyncHelper {
  /// Execute an async operation with loading and error handling
  static Future<T?> execute<T>({
    required Future<T> Function() operation,
    required Ref ref,
    String? loadingMessage,
    String? errorContext,
    bool showLoading = true,
    bool showError = true,
    bool canRetry = false,
    String retryAction = '',
    ErrorDisplayType errorDisplayType = ErrorDisplayType.snackbar,
    Duration? timeout,
  }) async {
    final globalLoading = ref.read(globalLoadingProvider.notifier);
    final globalError = ref.read(globalErrorProvider.notifier);

    try {
      // Clear any previous errors
      globalError.clearError();

      // Show loading if requested
      if (showLoading && loadingMessage != null) {
        globalLoading.show(loadingMessage);
      }

      // Execute operation with optional timeout
      late Future<T> future;
      if (timeout != null) {
        future = operation().timeout(timeout);
      } else {
        future = operation();
      }

      final result = await future;
      return result;
    } on TimeoutException {
      if (showError) {
        globalError.showNetworkError(
          message: 'Request timed out. Please try again.',
          canRetry: canRetry,
          retryAction: retryAction,
        );
      }
      return null;
    } on AppException catch (e, stackTrace) {
      if (showError) {
        globalError.showException(
          e,
          stackTrace: stackTrace,
          displayType: errorDisplayType,
          canRetry: canRetry,
          retryAction: retryAction,
          metadata: {'context': errorContext ?? ''},
        );
      }
      return null;
    } catch (e, stackTrace) {
      if (showError) {
        globalError.showError(
          'An unexpected error occurred${errorContext != null ? ' while $errorContext' : ''}',
          title: 'Unexpected Error',
          severity: ErrorSeverity.error,
          displayType: errorDisplayType,
          canRetry: canRetry,
          retryAction: retryAction,
          exception: e is Exception ? e : Exception(e.toString()),
          stackTrace: stackTrace,
          metadata: {'context': errorContext ?? ''},
        );
      }
      return null;
    } finally {
      // Hide loading if it was shown
      if (showLoading) {
        globalLoading.hide();
      }
    }
  }

  /// Execute an async operation with progress updates
  static Future<T?> executeWithProgress<T>({
    required Future<T> Function(void Function(double) updateProgress) operation,
    required Ref ref,
    required String loadingMessage,
    String? errorContext,
    bool showError = true,
    bool canRetry = false,
    String retryAction = '',
    ErrorDisplayType errorDisplayType = ErrorDisplayType.snackbar,
    Duration? timeout,
  }) async {
    final globalLoading = ref.read(globalLoadingProvider.notifier);
    final globalError = ref.read(globalErrorProvider.notifier);

    try {
      globalError.clearError();
      globalLoading.show(loadingMessage, showProgress: true);

      late Future<T> future;
      if (timeout != null) {
        future = operation((progress) {
          globalLoading.updateProgress(progress);
        }).timeout(timeout);
      } else {
        future = operation((progress) {
          globalLoading.updateProgress(progress);
        });
      }

      final result = await future;
      return result;
    } on TimeoutException {
      if (showError) {
        globalError.showNetworkError(
          message: 'Upload timed out. Please try again.',
          canRetry: canRetry,
          retryAction: retryAction,
        );
      }
      return null;
    } on AppException catch (e, stackTrace) {
      if (showError) {
        globalError.showException(
          e,
          stackTrace: stackTrace,
          displayType: errorDisplayType,
          canRetry: canRetry,
          retryAction: retryAction,
          metadata: {'context': errorContext ?? ''},
        );
      }
      return null;
    } catch (e, stackTrace) {
      if (showError) {
        globalError.showError(
          'An unexpected error occurred${errorContext != null ? ' while $errorContext' : ''}',
          title: 'Unexpected Error',
          severity: ErrorSeverity.error,
          displayType: errorDisplayType,
          canRetry: canRetry,
          retryAction: retryAction,
          exception: e is Exception ? e : Exception(e.toString()),
          stackTrace: stackTrace,
          metadata: {'context': errorContext ?? ''},
        );
      }
      return null;
    } finally {
      globalLoading.hide();
    }
  }

  /// Execute authentication operations with specific loading and error handling
  static Future<T?> executeAuth<T>({
    required Future<T> Function() operation,
    required Ref ref,
    required String authOperation,
    String? errorContext,
    bool canRetry = true,
    Duration? timeout,
  }) async {
    final globalLoading = ref.read(globalLoadingProvider.notifier);
    final globalError = ref.read(globalErrorProvider.notifier);

    try {
      globalError.clearError();
      globalLoading.showAuth(authOperation);

      late Future<T> future;
      if (timeout != null) {
        future = operation().timeout(timeout);
      } else {
        future = operation();
      }

      final result = await future;
      return result;
    } on TimeoutException {
      globalError.showAuthError(
        'Authentication timed out. Please try again.',
        canRetry: canRetry,
        retryAction: 'retry_auth',
      );
      return null;
    } on AppException catch (e, stackTrace) {
      globalError.showException(
        e,
        stackTrace: stackTrace,
        displayType: ErrorDisplayType.dialog,
        canRetry: canRetry,
        retryAction: 'retry_auth',
        metadata: {'context': errorContext ?? '', 'operation': authOperation},
      );
      return null;
    } catch (e, stackTrace) {
      globalError.showAuthError(
        'Authentication failed. Please try again.',
        canRetry: canRetry,
        retryAction: 'retry_auth',
      );
      return null;
    } finally {
      globalLoading.hide();
    }
  }

  /// Execute payment operations with specific error handling
  static Future<T?> executePayment<T>({
    required Future<T> Function() operation,
    required Ref ref,
    String loadingMessage = 'Processing payment...',
    String? errorContext,
    bool canRetry = true,
    Duration? timeout,
  }) async {
    final globalLoading = ref.read(globalLoadingProvider.notifier);
    final globalError = ref.read(globalErrorProvider.notifier);

    try {
      globalError.clearError();
      globalLoading.showOrder('processing_payment');

      late Future<T> future;
      if (timeout != null) {
        future = operation().timeout(timeout);
      } else {
        future = operation();
      }

      final result = await future;
      return result;
    } on TimeoutException {
      globalError.showPaymentError(
        'Payment processing timed out. Please try again.',
        canRetry: canRetry,
        retryAction: 'retry_payment',
      );
      return null;
    } on PaymentException catch (e, stackTrace) {
      globalError.showPaymentError(
        e.message,
        code: e.code ?? '',
        canRetry: canRetry,
        retryAction: 'retry_payment',
      );
      return null;
    } on AppException catch (e, stackTrace) {
      globalError.showException(
        e,
        stackTrace: stackTrace,
        displayType: ErrorDisplayType.dialog,
        canRetry: canRetry,
        retryAction: 'retry_payment',
        metadata: {'context': errorContext ?? ''},
      );
      return null;
    } catch (e, stackTrace) {
      globalError.showPaymentError(
        'Payment processing failed. Please try again.',
        canRetry: canRetry,
        retryAction: 'retry_payment',
      );
      return null;
    } finally {
      globalLoading.hide();
    }
  }

  /// Execute data fetch operations with caching support
  static Future<T?> executeFetch<T>({
    required Future<T> Function() operation,
    required Ref ref,
    String? loadingMessage,
    String? errorContext,
    bool showLoading = true,
    bool showError = true,
    bool canRetry = true,
    String retryAction = 'retry_fetch',
    Duration? timeout,
    Duration cacheTimeout = const Duration(minutes: 5),
  }) async {
    return execute<T>(
      operation: operation,
      ref: ref,
      loadingMessage: loadingMessage,
      errorContext: errorContext,
      showLoading: showLoading,
      showError: showError,
      canRetry: canRetry,
      retryAction: retryAction,
      errorDisplayType: ErrorDisplayType.snackbar,
      timeout: timeout,
    );
  }

  /// Execute silent operations (no loading, minimal error display)
  static Future<T?> executeSilent<T>({
    required Future<T> Function() operation,
    required Ref ref,
    String? errorContext,
    Duration? timeout,
  }) async {
    return execute<T>(
      operation: operation,
      ref: ref,
      showLoading: false,
      showError: false,
      timeout: timeout,
    );
  }

  /// Retry a failed operation
  static Future<T?> retry<T>({
    required Future<T> Function() operation,
    required Ref ref,
    String retryMessage = 'Retrying...',
    String? errorContext,
    int maxRetries = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) async {
    for (int attempt = 1; attempt <= maxRetries; attempt++) {
      final result = await execute<T>(
        operation: operation,
        ref: ref,
        loadingMessage: attempt == 1 ? retryMessage : '$retryMessage (Attempt $attempt)',
        errorContext: errorContext,
        showError: attempt == maxRetries, // Only show error on final attempt
        canRetry: false, // Disable built-in retry since we're handling it here
      );

      if (result != null) {
        return result;
      }

      if (attempt < maxRetries) {
        await Future.delayed(retryDelay);
      }
    }

    return null;
  }
}

/// Extension methods for common async patterns
extension AsyncValueX<T> on AsyncValue<T> {
  /// Map AsyncValue with proper error handling
  AsyncValue<R> mapWithError<R>(
    R Function(T data) mapper,
    WidgetRef ref, {
    String? errorContext,
  }) {
    return when(
      data: (data) {
        try {
          return AsyncValue.data(mapper(data));
        } catch (e, stackTrace) {
          ref.read(globalErrorProvider.notifier).showError(
                'Error processing data${errorContext != null ? ' for $errorContext' : ''}',
                exception: e is Exception ? e : Exception(e.toString()),
                stackTrace: stackTrace,
              );
          return AsyncValue.error(e, stackTrace);
        }
      },
      loading: () => const AsyncValue.loading(),
      error: (error, stackTrace) => AsyncValue.error(error, stackTrace),
    );
  }

  /// Handle AsyncValue states with proper UI feedback
  Widget handleStates({
    required Widget Function(T data) data,
    Widget Function()? loading,
    Widget Function(Object error, StackTrace stackTrace)? error,
    WidgetRef? ref,
  }) {
    return when(
      data: data,
      loading: loading ?? () => const Center(child: CircularProgressIndicator()),
      error: error ??
          (err, stack) {
            // Auto-report error if ref is provided
            if (ref != null) {
              ref.read(globalErrorProvider.notifier).showError(
                    'Failed to load data',
                    exception: err is Exception ? err : Exception(err.toString()),
                    stackTrace: stack,
                  );
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48),
                  const SizedBox(height: 16),
                  Text('Failed to load data'),
                  if (ref != null)
                    ElevatedButton(
                      onPressed: () {
                        // Implement retry logic based on context
                      },
                      child: const Text('Retry'),
                    ),
                ],
              ),
            );
          },
    );
  }
}