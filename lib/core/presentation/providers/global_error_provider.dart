// lib/core/presentation/providers/global_error_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../exceptions/app_exceptions.dart';

part 'global_error_provider.freezed.dart';
part 'global_error_provider.g.dart';

/// Error display type
enum ErrorDisplayType {
  snackbar,
  dialog,
  banner,
  inline,
  none,
}

/// Error severity level
enum ErrorSeverity {
  info,
  warning,
  error,
  critical,
}

/// Global error state
@freezed
class ErrorState with _$ErrorState {
  const factory ErrorState({
    @Default(false) bool hasError,
    @Default('') String message,
    @Default('') String title,
    @Default('') String code,
    @Default(ErrorSeverity.error) ErrorSeverity severity,
    @Default(ErrorDisplayType.snackbar) ErrorDisplayType displayType,
    @Default(true) bool canRetry,
    @Default('') String retryAction,
    Exception? exception,
    StackTrace? stackTrace,
    @Default({}) Map<String, dynamic> metadata,
  }) = _ErrorState;
}

/// Global error provider for managing app-wide error states
@riverpod
class GlobalError extends _$GlobalError {
  @override
  ErrorState build() {
    return const ErrorState();
  }

  /// Show a generic error
  void showError(
    String message, {
    String title = 'Error',
    String code = '',
    ErrorSeverity severity = ErrorSeverity.error,
    ErrorDisplayType displayType = ErrorDisplayType.snackbar,
    bool canRetry = false,
    String retryAction = '',
    Exception? exception,
    StackTrace? stackTrace,
    Map<String, dynamic> metadata = const {},
  }) {
    state = ErrorState(
      hasError: true,
      message: message,
      title: title,
      code: code,
      severity: severity,
      displayType: displayType,
      canRetry: canRetry,
      retryAction: retryAction,
      exception: exception,
      stackTrace: stackTrace,
      metadata: metadata,
    );
  }

  /// Show error from exception
  void showException(
    Exception exception, {
    StackTrace? stackTrace,
    ErrorDisplayType displayType = ErrorDisplayType.snackbar,
    bool canRetry = false,
    String retryAction = '',
    Map<String, dynamic> metadata = const {},
  }) {
    if (exception is AppException) {
      _showAppException(
        exception,
        displayType: displayType,
        canRetry: canRetry,
        retryAction: retryAction,
        stackTrace: stackTrace,
        metadata: metadata,
      );
    } else {
      showError(
        'An unexpected error occurred',
        title: 'Unexpected Error',
        severity: ErrorSeverity.error,
        displayType: displayType,
        canRetry: canRetry,
        retryAction: retryAction,
        exception: exception,
        stackTrace: stackTrace,
        metadata: metadata,
      );
    }
  }

  /// Show authentication error
  void showAuthError(
    String message, {
    String code = '',
    bool canRetry = true,
    String retryAction = 'retry_auth',
  }) {
    showError(
      message,
      title: 'Authentication Error',
      code: code,
      severity: ErrorSeverity.warning,
      displayType: ErrorDisplayType.dialog,
      canRetry: canRetry,
      retryAction: retryAction,
      metadata: {'category': 'auth'},
    );
  }

  /// Show network error
  void showNetworkError({
    String message = 'Network error occurred',
    bool canRetry = true,
    String retryAction = 'retry_network',
  }) {
    showError(
      message,
      title: 'Connection Error',
      severity: ErrorSeverity.warning,
      displayType: ErrorDisplayType.banner,
      canRetry: canRetry,
      retryAction: retryAction,
      metadata: {'category': 'network'},
    );
  }

  /// Show validation error
  void showValidationError(
    String message, {
    String field = '',
    ErrorDisplayType displayType = ErrorDisplayType.inline,
  }) {
    showError(
      message,
      title: 'Validation Error',
      severity: ErrorSeverity.warning,
      displayType: displayType,
      canRetry: false,
      metadata: {'category': 'validation', 'field': field},
    );
  }

  /// Show payment error
  void showPaymentError(
    String message, {
    String code = '',
    bool canRetry = true,
    String retryAction = 'retry_payment',
  }) {
    showError(
      message,
      title: 'Payment Error',
      code: code,
      severity: ErrorSeverity.error,
      displayType: ErrorDisplayType.dialog,
      canRetry: canRetry,
      retryAction: retryAction,
      metadata: {'category': 'payment'},
    );
  }

  /// Show critical system error
  void showCriticalError(
    String message, {
    String code = '',
    Exception? exception,
    StackTrace? stackTrace,
  }) {
    showError(
      message,
      title: 'System Error',
      code: code,
      severity: ErrorSeverity.critical,
      displayType: ErrorDisplayType.dialog,
      canRetry: false,
      exception: exception,
      stackTrace: stackTrace,
      metadata: {'category': 'critical'},
    );
  }

  /// Show info message
  void showInfo(
    String message, {
    String title = 'Information',
    ErrorDisplayType displayType = ErrorDisplayType.snackbar,
  }) {
    showError(
      message,
      title: title,
      severity: ErrorSeverity.info,
      displayType: displayType,
      canRetry: false,
      metadata: {'category': 'info'},
    );
  }

  /// Show warning message
  void showWarning(
    String message, {
    String title = 'Warning',
    ErrorDisplayType displayType = ErrorDisplayType.snackbar,
  }) {
    showError(
      message,
      title: title,
      severity: ErrorSeverity.warning,
      displayType: displayType,
      canRetry: false,
      metadata: {'category': 'warning'},
    );
  }

  /// Clear error state
  void clearError() {
    state = const ErrorState();
  }

  /// Handle app-specific exceptions
  void _showAppException(
    AppException exception, {
    required ErrorDisplayType displayType,
    required bool canRetry,
    required String retryAction,
    StackTrace? stackTrace,
    Map<String, dynamic> metadata = const {},
  }) {
    ErrorSeverity severity;
    String title;
    Map<String, dynamic> exceptionMetadata = Map.from(metadata);

    switch (exception.runtimeType) {
      case AuthException:
        severity = ErrorSeverity.warning;
        title = 'Authentication Error';
        exceptionMetadata['category'] = 'auth';
        break;
      case NetworkException:
        severity = ErrorSeverity.warning;
        title = 'Connection Error';
        exceptionMetadata['category'] = 'network';
        break;
      case DataException:
        severity = ErrorSeverity.error;
        title = 'Data Error';
        exceptionMetadata['category'] = 'data';
        break;
      case ValidationException:
        severity = ErrorSeverity.warning;
        title = 'Validation Error';
        exceptionMetadata['category'] = 'validation';
        displayType = ErrorDisplayType.inline;
        break;
      case PermissionException:
        severity = ErrorSeverity.warning;
        title = 'Permission Required';
        exceptionMetadata['category'] = 'permission';
        displayType = ErrorDisplayType.dialog;
        break;
      case PaymentException:
        severity = ErrorSeverity.error;
        title = 'Payment Error';
        exceptionMetadata['category'] = 'payment';
        displayType = ErrorDisplayType.dialog;
        break;
      default:
        severity = ErrorSeverity.error;
        title = 'Error';
        exceptionMetadata['category'] = 'unknown';
    }

    state = ErrorState(
      hasError: true,
      message: exception.message,
      title: title,
      code: exception.code ?? '',
      severity: severity,
      displayType: displayType,
      canRetry: canRetry,
      retryAction: retryAction,
      exception: exception,
      stackTrace: stackTrace,
      metadata: exceptionMetadata,
    );
  }
}

/// Helper for handling async operations with error management
extension ErrorHandling on GlobalError {
  /// Execute an async operation with error handling
  Future<T?> handleAsync<T>(
    Future<T> Function() operation, {
    String errorContext = '',
    bool showError = true,
    bool canRetry = false,
    String retryAction = '',
    ErrorDisplayType displayType = ErrorDisplayType.snackbar,
  }) async {
    try {
      clearError();
      return await operation();
    } on AppException catch (e, stackTrace) {
      if (showError) {
        showException(
          e,
          stackTrace: stackTrace,
          displayType: displayType,
          canRetry: canRetry,
          retryAction: retryAction,
          metadata: {'context': errorContext},
        );
      }
      return null;
    } catch (e, stackTrace) {
      if (showError) {
        this.showError(
          'An unexpected error occurred${errorContext.isNotEmpty ? ' while $errorContext' : ''}',
          title: 'Unexpected Error',
          severity: ErrorSeverity.error,
          displayType: displayType,
          canRetry: canRetry,
          retryAction: retryAction,
          exception: e is Exception ? e : Exception(e.toString()),
          stackTrace: stackTrace,
          metadata: {'context': errorContext},
        );
      }
      return null;
    }
  }

  /// Execute an async operation with custom error handling
  Future<T?> handleAsyncWithCustomError<T>(
    Future<T> Function() operation,
    String Function(dynamic error) errorMessageBuilder, {
    String errorContext = '',
    bool canRetry = false,
    String retryAction = '',
    ErrorDisplayType displayType = ErrorDisplayType.snackbar,
  }) async {
    try {
      clearError();
      return await operation();
    } catch (e, stackTrace) {
      final message = errorMessageBuilder(e);
      showError(
        message,
        title: 'Error',
        severity: ErrorSeverity.error,
        displayType: displayType,
        canRetry: canRetry,
        retryAction: retryAction,
        exception: e is Exception ? e : Exception(e.toString()),
        stackTrace: stackTrace,
        metadata: {'context': errorContext},
      );
      return null;
    }
  }
}