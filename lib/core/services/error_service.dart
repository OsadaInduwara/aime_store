// lib/core/services/error_service.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import '../exceptions/app_exceptions.dart';

/// Service to handle errors globally across the app
class ErrorService {
  static final ErrorService _instance = ErrorService._internal();
  factory ErrorService() => _instance;
  ErrorService._internal();

  /// Handle and display error to user
  Future<void> handleError(
    dynamic error, {
    StackTrace? stackTrace,
    BuildContext? context,
    String? customMessage,
    bool showSnackbar = true,
    VoidCallback? onRetry,
  }) async {
    // Log error
    await _logError(error, stackTrace);

    // Get user-friendly message
    final message = customMessage ?? _getUserFriendlyMessage(error);

    // Show error to user if context is available
    if (context != null && context.mounted && showSnackbar) {
      _showErrorSnackbar(context, message, onRetry);
    }
  }

  /// Log error to console and crash reporting service
  Future<void> _logError(dynamic error, StackTrace? stackTrace) async {
    // Log to console in debug mode
    debugPrint('🔥 Error: $error');
    if (stackTrace != null) {
      debugPrint('📍 StackTrace: $stackTrace');
    }

    try {
      // Log to Firebase Crashlytics in release mode
      if (!kDebugMode) {
        if (error is AppException) {
          await FirebaseCrashlytics.instance.recordError(
            error,
            stackTrace,
            reason: 'App Exception: ${error.code}',
          );
        } else {
          await FirebaseCrashlytics.instance.recordError(
            error,
            stackTrace,
            reason: 'Unhandled Error',
          );
        }
      }
    } catch (e) {
      debugPrint('Failed to log error to Crashlytics: $e');
    }
  }

  /// Convert error to user-friendly message
  String _getUserFriendlyMessage(dynamic error) {
    if (error is AppException) {
      return error.message;
    }

    if (error is FormatException) {
      return 'Invalid data format. Please try again';
    }

    if (error.toString().toLowerCase().contains('network')) {
      return 'Network error. Please check your internet connection';
    }

    if (error.toString().toLowerCase().contains('timeout')) {
      return 'Request timed out. Please try again';
    }

    // Default fallback
    return 'Something went wrong. Please try again';
  }

  /// Show error snackbar to user
  void _showErrorSnackbar(
    BuildContext context,
    String message,
    VoidCallback? onRetry,
  ) {
    if (!context.mounted) return;

    final theme = Theme.of(context);
    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: theme.colorScheme.error,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      action: onRetry != null
          ? SnackBarAction(
              label: 'Retry',
              textColor: Colors.white,
              onPressed: onRetry,
            )
          : null,
      duration: const Duration(seconds: 4),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  /// Show success message
  static void showSuccess(BuildContext context, String message) {
    if (!context.mounted) return;

    final theme = Theme.of(context);
    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(
            Icons.check_circle_outline,
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  /// Show warning message
  static void showWarning(BuildContext context, String message) {
    if (!context.mounted) return;

    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(
            Icons.warning_outlined,
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.orange,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  /// Show info message
  static void showInfo(BuildContext context, String message) {
    if (!context.mounted) return;

    final theme = Theme.of(context);
    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(
            Icons.info_outline,
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: theme.colorScheme.primary,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
