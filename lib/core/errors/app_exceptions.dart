// lib/core/exceptions/app_exceptions.dart

/// Base exception class for all app exceptions
abstract class AppException implements Exception {
  const AppException(this.message, [this.code]);

  final String message;
  final String? code;

  @override
  String toString() => 'AppException: $message${code != null ? ' ($code)' : ''}';
}

/// Authentication related exceptions
class AuthException extends AppException {
  const AuthException(super.message, [super.code]);

  factory AuthException.fromFirebaseAuthException(dynamic firebaseException) {
    final code = firebaseException.code ?? '';
    final message = _getAuthErrorMessage(code);
    return AuthException(message, code);
  }

  static String _getAuthErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'user-not-found':
        return 'No account found with this email address';
      case 'wrong-password':
        return 'Incorrect password. Please try again';
      case 'email-already-in-use':
        return 'An account already exists with this email';
      case 'weak-password':
        return 'Password is too weak. Use at least 6 characters';
      case 'invalid-email':
        return 'Please enter a valid email address';
      case 'user-disabled':
        return 'This account has been disabled';
      case 'too-many-requests':
        return 'Too many failed attempts. Please try again later';
      case 'invalid-phone-number':
        return 'Please enter a valid phone number';
      case 'invalid-verification-code':
        return 'Invalid verification code. Please try again';
      case 'session-expired':
        return 'Verification session expired. Please request a new code';
      case 'operation-not-allowed':
        return 'This sign-in method is not enabled';
      case 'network-request-failed':
        return 'Network error. Please check your connection';
      case 'invalid-credential':
        return 'Invalid credentials. Please check your information';
      default:
        return 'Authentication failed. Please try again';
    }
  }
}

/// Network related exceptions
class NetworkException extends AppException {
  const NetworkException(super.message, [super.code]);

  factory NetworkException.noConnection() {
    return const NetworkException('No internet connection. Please check your network settings');
  }

  factory NetworkException.timeout() {
    return const NetworkException('Request timed out. Please try again');
  }

  factory NetworkException.serverError(int statusCode) {
    return NetworkException('Server error occurred', statusCode.toString());
  }
}

/// Data/Storage related exceptions
class DataException extends AppException {
  const DataException(super.message, [super.code]);

  factory DataException.notFound(String resource) {
    return DataException('$resource not found');
  }

  factory DataException.parseError() {
    return const DataException('Failed to parse data');
  }

  factory DataException.storageError() {
    return const DataException('Failed to save data');
  }
}

/// Validation related exceptions
class ValidationException extends AppException {
  const ValidationException(super.message, [super.code]);

  factory ValidationException.required(String field) {
    return ValidationException('$field is required');
  }

  factory ValidationException.invalid(String field) {
    return ValidationException('$field is not valid');
  }

  factory ValidationException.tooShort(String field, int minLength) {
    return ValidationException('$field must be at least $minLength characters');
  }

  factory ValidationException.tooLong(String field, int maxLength) {
    return ValidationException('$field must be less than $maxLength characters');
  }
}

/// Permission related exceptions
class PermissionException extends AppException {
  const PermissionException(super.message, [super.code]);

  factory PermissionException.denied(String permission) {
    return PermissionException('$permission permission denied');
  }

  factory PermissionException.permanentlyDenied(String permission) {
    return PermissionException('$permission permission permanently denied. Please enable in settings');
  }
}

/// Payment related exceptions
class PaymentException extends AppException {
  const PaymentException(super.message, [super.code]);

  factory PaymentException.cardDeclined() {
    return const PaymentException('Card was declined. Please try another payment method');
  }

  factory PaymentException.insufficientFunds() {
    return const PaymentException('Insufficient funds. Please check your balance');
  }

  factory PaymentException.processingError() {
    return const PaymentException('Payment processing failed. Please try again');
  }
}
