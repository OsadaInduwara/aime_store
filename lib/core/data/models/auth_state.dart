// lib/core/data/models/auth_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_model.dart';
import '../../exceptions/app_exceptions.dart';

part 'auth_state.freezed.dart';

/// Represents the authentication state with better granularity
@freezed
class AuthState with _$AuthState {
  /// User is not authenticated
  const factory AuthState.unauthenticated() = Unauthenticated;

  /// Authentication is in progress
  const factory AuthState.authenticating({String? message}) = Authenticating;

  /// User is authenticated
  const factory AuthState.authenticated(UserModel user) = Authenticated;

  /// Authentication failed with error
  const factory AuthState.error(AppException exception) = AuthError;

  /// Email verification required
  const factory AuthState.emailVerificationRequired(String email) = EmailVerificationRequired;

  /// Phone verification required
  const factory AuthState.phoneVerificationRequired({
    required String phoneNumber,
    required String verificationId,
  }) = PhoneVerificationRequired;

  /// Profile setup required
  const factory AuthState.profileSetupRequired(UserModel partialUser) = ProfileSetupRequired;
}

/// Authentication method types
enum AuthMethod {
  phone,
  email,
  google,
  facebook,
  apple,
}

/// Authentication result
@freezed
class AuthResult with _$AuthResult {
  /// Success result
  const factory AuthResult.success({
    UserModel? user,
    String? message,
  }) = AuthSuccess;

  /// Error result
  const factory AuthResult.error(AppException exception) = AuthResultError;

  /// Partial success - additional steps required
  const factory AuthResult.requiresAction({
    required AuthActionType actionType,
    Map<String, dynamic>? data,
    String? message,
  }) = AuthRequiresAction;
}

/// Types of additional actions required during authentication
enum AuthActionType {
  emailVerification,
  phoneVerification,
  profileSetup,
  storeSetup,
  twoFactorAuth,
}
