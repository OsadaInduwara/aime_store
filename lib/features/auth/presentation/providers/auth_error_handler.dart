// lib/features/auth/presentation/providers/auth_error_handler.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/error_service.dart';
import '../../../../core/exceptions/app_exceptions.dart';

/// Authentication-specific error handler
class AuthErrorHandler {
  static final AuthErrorHandler _instance = AuthErrorHandler._internal();
  factory AuthErrorHandler() => _instance;
  AuthErrorHandler._internal();

  /// Handle authentication-specific errors
  Future<void> handleAuthError(
    dynamic error, {
    BuildContext? context,
    VoidCallback? onRetry,
    AuthErrorType? errorType,
  }) async {
    final errorService = ErrorService();

    String? customMessage;

    // Provide context-specific error messages
    if (error is AuthException) {
      switch (error.code) {
        case 'invalid-phone-number':
          customMessage = 'Please enter a valid phone number with country code';
          break;
        case 'invalid-verification-code':
          customMessage = 'The verification code is incorrect. Please try again';
          break;
        case 'session-expired':
          customMessage = 'Verification session expired. We\'ll send you a new code';
          if (onRetry != null) {
            // Auto-retry for expired sessions
            Future.delayed(const Duration(seconds: 2), onRetry);
          }
          break;
        case 'too-many-requests':
          customMessage = 'Too many attempts. Please wait before trying again';
          break;
        case 'network-request-failed':
          customMessage = 'Network error. Please check your connection and try again';
          break;
      }
    }

    await errorService.handleError(
      error,
      context: context,
      customMessage: customMessage,
      onRetry: onRetry,
    );

    // Log specific auth error types for analytics
    if (errorType != null) {
      _logAuthError(errorType, error);
    }
  }

  void _logAuthError(AuthErrorType errorType, dynamic error) {
    // Log to analytics/crashlytics with auth-specific context
    debugPrint('Auth Error [${errorType.name}]: $error');
  }
}

/// Provider for authentication error handler
final authErrorHandlerProvider = Provider<AuthErrorHandler>(
  (ref) => AuthErrorHandler(),
);

/// Types of authentication errors for better categorization
enum AuthErrorType {
  phoneVerification,
  otpVerification,
  emailAuth,
  socialAuth,
  profileSetup,
  signOut,
}
