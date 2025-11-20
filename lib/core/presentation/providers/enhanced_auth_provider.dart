// lib/core/presentation/providers/enhanced_auth_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../exceptions/app_exceptions.dart';
import '../../services/auth_services.dart';
import '../../data/models/user_model.dart';
import '../../utils/async_helper.dart';
import 'global_loading_provider.dart';
import 'global_error_provider.dart';

part 'enhanced_auth_provider.g.dart';

/// Enhanced auth provider with proper error handling and loading states
@riverpod
class EnhancedAuthNotifier extends _$EnhancedAuthNotifier {
  @override
  User? build() {
    // Listen to auth state changes
    final authStream = ref.watch(authStateChangesProvider);
    return authStream.when(
      data: (user) => user,
      loading: () => null,
      error: (error, stack) {
        // Handle auth state errors
        ref.read(globalErrorProvider.notifier).showAuthError(
              'Authentication state error occurred',
              canRetry: true,
            );
        return null;
      },
    );
  }

  /// Sign in with email and password
  Future<bool> signInWithEmail({
    required String email,
    required String password,
  }) async {
    final result = await AsyncHelper.executeAuth<UserModel?>(
      operation: () => ref.read(enhancedAuthServicesProvider).signInWithEmail(
            email: email,
            password: password,
          ),
      ref: ref,
      authOperation: 'signin',
      errorContext: 'signing in with email',
      canRetry: true,
    );

    if (result != null) {
      // Convert UserModel to Firebase User if needed
      state = FirebaseAuth.instance.currentUser;
      return true;
    }
    return false;
  }

  /// Sign up with email and password
  Future<bool> signUpWithEmail({
    required String email,
    required String password,
    required String displayName,
  }) async {
    final result = await AsyncHelper.executeAuth<UserModel?>(
      operation: () => ref.read(enhancedAuthServicesProvider).signUpWithEmail(
            email: email,
            password: password,
            displayName: displayName,
          ),
      ref: ref,
      authOperation: 'signup',
      errorContext: 'creating account',
      canRetry: true,
    );

    if (result != null) {
      // Convert UserModel to Firebase User if needed
      state = FirebaseAuth.instance.currentUser;
      return true;
    }
    return false;
  }

  /// Sign in with phone number
  Future<bool> signInWithPhone({
    required String phoneNumber,
    required void Function(String verificationId) onCodeSent,
  }) async {
    final globalLoading = ref.read(globalLoadingProvider.notifier);
    final globalError = ref.read(globalErrorProvider.notifier);

    try {
      globalLoading.showAuth('verify_phone');

      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          globalLoading.updateMessage('Signing you in...');
          try {
            final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
            state = userCredential.user;
          } catch (e) {
            globalError.showAuthError(
              'Auto-verification failed. Please enter the code manually.',
              canRetry: true,
            );
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          globalError.showException(
            AuthException.fromFirebaseAuthException(e),
            displayType: ErrorDisplayType.dialog,
            canRetry: true,
            retryAction: 'retry_phone_auth',
          );
        },
        codeSent: (String verificationId, int? resendToken) {
          globalLoading.hide();
          onCodeSent(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Handle timeout
        },
      );

      return true;
    } catch (e, stackTrace) {
      globalError.showException(
        e is Exception ? e : Exception(e.toString()),
        stackTrace: stackTrace,
        displayType: ErrorDisplayType.dialog,
        canRetry: true,
        retryAction: 'retry_phone_auth',
      );
      return false;
    } finally {
      globalLoading.hide();
    }
  }

  /// Verify OTP and complete phone authentication
  Future<bool> verifyOTP({
    required String verificationId,
    required String smsCode,
  }) async {
    final result = await AsyncHelper.executeAuth<UserModel?>(
      operation: () => ref.read(enhancedAuthServicesProvider).verifyOTP(verificationId, smsCode),
      ref: ref,
      authOperation: 'verify_phone',
      errorContext: 'verifying OTP',
      canRetry: true,
    );

    if (result != null) {
      state = FirebaseAuth.instance.currentUser;
      return true;
    }
    return false;
  }

  /// Sign in with Google
  Future<bool> signInWithGoogle() async {
    final result = await AsyncHelper.executeAuth<UserModel?>(
      operation: () => ref.read(enhancedAuthServicesProvider).signInWithGoogle(),
      ref: ref,
      authOperation: 'google_signin',
      errorContext: 'signing in with Google',
      canRetry: true,
    );

    if (result != null) {
      state = FirebaseAuth.instance.currentUser;
      return true;
    }
    return false;
  }

  /// Sign in with Facebook
  Future<bool> signInWithFacebook() async {
    final result = await AsyncHelper.executeAuth<UserModel?>(
      operation: () => ref.read(enhancedAuthServicesProvider).signInWithFacebook(),
      ref: ref,
      authOperation: 'facebook_signin',
      errorContext: 'signing in with Facebook',
      canRetry: true,
    );

    if (result != null) {
      state = FirebaseAuth.instance.currentUser;
      return true;
    }
    return false;
  }

  /// Send password reset email
  Future<bool> sendPasswordResetEmail(String email) async {
    try {
      await AsyncHelper.executeAuth<void>(
        operation: () => ref.read(enhancedAuthServicesProvider).sendPasswordResetEmail(email),
        ref: ref,
        authOperation: 'reset_password',
        errorContext: 'sending password reset email',
        canRetry: true,
      );

      ref.read(globalErrorProvider.notifier).showInfo(
            'Password reset email sent to $email',
            title: 'Email Sent',
          );
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Send email verification
  Future<bool> sendEmailVerification() async {
    if (state?.email == null) {
      ref.read(globalErrorProvider.notifier).showValidationError(
            'No email address found for verification',
          );
      return false;
    }

    try {
      await AsyncHelper.executeAuth<void>(
        operation: () => ref.read(enhancedAuthServicesProvider).sendEmailVerification(),
        ref: ref,
        authOperation: 'verify_email',
        errorContext: 'sending email verification',
        canRetry: true,
      );

      ref.read(globalErrorProvider.notifier).showInfo(
            'Verification email sent to ${state?.email}',
            title: 'Verification Email Sent',
          );
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Update user profile
  Future<bool> updateProfile({
    String? displayName,
    String? photoURL,
  }) async {
    try {
      await AsyncHelper.execute<void>(
        operation: () async {
          final currentUser = state;
          if (currentUser != null) {
            // Update Firebase Auth profile
            if (displayName != null) {
              await currentUser.updateDisplayName(displayName);
            }
            if (photoURL != null) {
              await currentUser.updatePhotoURL(photoURL);
            }
          }
        },
        ref: ref,
        loadingMessage: 'Updating profile...',
        errorContext: 'updating profile',
        canRetry: true,
        retryAction: 'retry_update_profile',
      );

      // Refresh the current user
      await state?.reload();
      state = FirebaseAuth.instance.currentUser;

      ref.read(globalErrorProvider.notifier).showInfo(
            'Profile updated successfully',
            title: 'Profile Updated',
          );
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Sign out
  Future<void> signOut() async {
    try {
      await AsyncHelper.executeAuth<void>(
        operation: () => ref.read(enhancedAuthServicesProvider).signOut(),
        ref: ref,
        authOperation: 'logout',
        errorContext: 'signing out',
        canRetry: false,
      );
    } catch (e) {
      // Continue with sign out even if service call fails
    }

    state = null;
  }

  /// Delete user account
  Future<bool> deleteAccount() async {
    try {
      await AsyncHelper.execute<void>(
        operation: () => ref.read(enhancedAuthServicesProvider).deleteAccount(),
        ref: ref,
        loadingMessage: 'Deleting account...',
        errorContext: 'deleting account',
        errorDisplayType: ErrorDisplayType.dialog,
        canRetry: false,
      );

      state = null;
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Link account with email credential
  Future<bool> linkWithEmail({
    required String email,
    required String password,
  }) async {
    final result = await AsyncHelper.execute<User>(
      operation: () async {
        final credential = EmailAuthProvider.credential(email: email, password: password);
        final userCredential = await FirebaseAuth.instance.currentUser?.linkWithCredential(credential);
        return userCredential?.user ?? (throw Exception('Failed to link email account'));
      },
      ref: ref,
      loadingMessage: 'Linking accounts...',
      errorContext: 'linking email account',
      canRetry: true,
      retryAction: 'retry_link_email',
    );

    if (result != null) {
      state = result;
      ref.read(globalErrorProvider.notifier).showInfo(
            'Email account linked successfully',
            title: 'Accounts Linked',
          );
      return true;
    }
    return false;
  }

  /// Reauthenticate user
  Future<bool> reauthenticate({
    required String email,
    required String password,
  }) async {
    try {
      await AsyncHelper.executeAuth<void>(
        operation: () => ref.read(enhancedAuthServicesProvider).reauthenticateWithPassword(password),
        ref: ref,
        authOperation: 'signin',
        errorContext: 'reauthenticating',
        canRetry: true,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Check if email is verified
  bool get isEmailVerified => state?.emailVerified ?? false;

  /// Get current user email
  String? get userEmail => state?.email;

  /// Get current user display name
  String? get userDisplayName => state?.displayName;

  /// Get current user photo URL
  String? get userPhotoURL => state?.photoURL;

  /// Check if user is signed in
  bool get isSignedIn => state != null;

  /// Get user UID
  String? get uid => state?.uid;
}

/// Provider for auth state changes stream
@riverpod
Stream<User?> authStateChanges(AuthStateChangesRef ref) {
  return FirebaseAuth.instance.authStateChanges();
}

/// Provider for enhanced auth service
@riverpod
AuthService enhancedAuthServices(EnhancedAuthServicesRef ref) {
  return AuthService();
}