// lib/core/presentation/providers/auth_provider.dart
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../../data/models/user_model.dart';
import '../../data/models/auth_state.dart';
import '../../services/firebase_service.dart';
import '../../services/error_service.dart';
import '../../exceptions/app_exceptions.dart';

/// Improved authentication provider with better state management
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(),
);

/// Authentication controller provider for UI actions
final authControllerProvider = Provider<AuthController>(
  (ref) => AuthController(ref.read(authProvider.notifier)),
);

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState.authenticating()) {
    _init();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final ErrorService _errorService = ErrorService();

  StreamSubscription<User?>? _authStreamSubscription;

  /// Initialize authentication state
  Future<void> _init() async {
    try {
      // Listen to auth state changes with debouncing to prevent rapid state changes
      _authStreamSubscription = _auth.authStateChanges()
          .distinct() // Prevent duplicate events
          .listen(
            _handleAuthStateChange,
            onError: (error) => _handleError(error),
          );

      // Check current user immediately
      final currentUser = _auth.currentUser;
      await _handleAuthStateChange(currentUser);
    } catch (error) {
      _handleError(error);
    }
  }

  @override
  void dispose() {
    _authStreamSubscription?.cancel();
    super.dispose();
  }

  /// Handle Firebase auth state changes
  Future<void> _handleAuthStateChange(User? user) async {
    try {
      if (user == null) {
        state = const AuthState.unauthenticated();
        return;
      }

      // Check if email verification is required
      if (user.email != null && !user.emailVerified) {
        state = AuthState.emailVerificationRequired(user.email!);
        return;
      }

      // Load or create user profile
      final userModel = await _loadOrCreateUserProfile(user);

      // Check if profile setup is required
      if (_requiresProfileSetup(userModel)) {
        state = AuthState.profileSetupRequired(userModel);
        return;
      }

      // User is fully authenticated
      state = AuthState.authenticated(userModel);

      // Set analytics user ID
      await FirebaseService.setUserId(user.uid);
    } catch (error) {
      _handleError(error);
    }
  }

  /// Load existing user or create new profile
  Future<UserModel> _loadOrCreateUserProfile(User firebaseUser) async {
    final userDoc = await _firestore
        .collection('users')
        .doc(firebaseUser.uid)
        .get();

    if (userDoc.exists && userDoc.data() != null) {
      // Existing user
      return UserModel.fromJson({
        'id': firebaseUser.uid,
        ...userDoc.data()!,
      });
    } else {
      // New user - create basic profile
      final newUser = UserModel(
        id: firebaseUser.uid,
        phoneNumber: firebaseUser.phoneNumber ?? '',
        displayName: firebaseUser.displayName ?? 'User',
        email: firebaseUser.email,
        profileImage: firebaseUser.photoURL,
        userType: UserType.customer,
        addresses: const [],
        preferences: const UserPreferences(),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      // Save to Firestore
      await _firestore
          .collection('users')
          .doc(firebaseUser.uid)
          .set(newUser.toJson());

      return newUser;
    }
  }

  /// Check if user profile setup is required
  bool _requiresProfileSetup(UserModel user) {
    // Check if essential fields are missing
    return user.displayName.isEmpty ||
           user.displayName == 'User' ||
           (user.phoneNumber.isEmpty && user.email == null);
  }

  /// Handle errors consistently
  void _handleError(dynamic error) {
    final appException = error is AppException
        ? error
        : error.toString().contains('firebase')
            ? AuthException.fromFirebaseAuthException(error)
            : AuthException(error.toString());

    state = AuthState.error(appException);
    _errorService.handleError(error);
  }

  /// Phone authentication
  Future<AuthResult> signInWithPhone(String phoneNumber) async {
    try {
      state = const AuthState.authenticating(message: 'Sending verification code...');

      final completer = Completer<AuthResult>();

      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          try {
            await _auth.signInWithCredential(credential);
            completer.complete(const AuthResult.success(message: 'Phone verified successfully'));
          } catch (error) {
            completer.complete(AuthResult.error(AuthException.fromFirebaseAuthException(error)));
          }
        },
        verificationFailed: (FirebaseAuthException error) {
          completer.complete(AuthResult.error(AuthException.fromFirebaseAuthException(error)));
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
          state = AuthState.phoneVerificationRequired(
            phoneNumber: phoneNumber,
            verificationId: verificationId,
          );
          completer.complete(AuthResult.requiresAction(
            actionType: AuthActionType.phoneVerification,
            data: {
              'phoneNumber': phoneNumber,
              'verificationId': verificationId,
            },
            message: 'Verification code sent to $phoneNumber',
          ));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
        },
      );

      return await completer.future;
    } catch (error) {
      _handleError(error);
      return AuthResult.error(AuthException.fromFirebaseAuthException(error));
    }
  }

  /// Verify OTP
  Future<AuthResult> verifyOTP(String verificationId, String otp) async {
    try {
      state = const AuthState.authenticating(message: 'Verifying code...');

      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );

      await _auth.signInWithCredential(credential);
      await FirebaseService.logLogin('phone');

      return const AuthResult.success(message: 'Phone verified successfully');
    } catch (error) {
      _handleError(error);
      return AuthResult.error(AuthException.fromFirebaseAuthException(error));
    }
  }

  /// Email sign in
  Future<AuthResult> signInWithEmail(String email, String password) async {
    try {
      state = const AuthState.authenticating(message: 'Signing in...');

      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null && !credential.user!.emailVerified) {
        return AuthResult.requiresAction(
          actionType: AuthActionType.emailVerification,
          data: {'email': email},
          message: 'Please verify your email address',
        );
      }

      await FirebaseService.logLogin('email');
      return const AuthResult.success(message: 'Signed in successfully');
    } catch (error) {
      _handleError(error);
      return AuthResult.error(AuthException.fromFirebaseAuthException(error));
    }
  }

  /// Email sign up
  Future<AuthResult> signUpWithEmail(String email, String password, String displayName) async {
    try {
      state = const AuthState.authenticating(message: 'Creating account...');

      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        await credential.user!.updateDisplayName(displayName);
        await credential.user!.sendEmailVerification();
        await FirebaseService.logSignUp('email');

        return AuthResult.requiresAction(
          actionType: AuthActionType.emailVerification,
          data: {'email': email},
          message: 'Verification email sent to $email',
        );
      }

      return const AuthResult.success();
    } catch (error) {
      _handleError(error);
      return AuthResult.error(AuthException.fromFirebaseAuthException(error));
    }
  }

  /// Google sign in
  Future<AuthResult> signInWithGoogle() async {
    try {
      state = const AuthState.authenticating(message: 'Signing in with Google...');

      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        state = const AuthState.unauthenticated();
        return AuthResult.error(const AuthException('Sign in cancelled'));
      }

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);
      await FirebaseService.logLogin('google');

      return const AuthResult.success(message: 'Signed in with Google');
    } catch (error) {
      _handleError(error);
      return AuthResult.error(AuthException.fromFirebaseAuthException(error));
    }
  }

  /// Facebook sign in
  Future<AuthResult> signInWithFacebook() async {
    try {
      state = const AuthState.authenticating(message: 'Signing in with Facebook...');

      final result = await FacebookAuth.instance.login();

      if (result.status != LoginStatus.success) {
        state = const AuthState.unauthenticated();
        return AuthResult.error(const AuthException('Facebook sign in failed'));
      }

      final accessToken = result.accessToken!;
      final credential = FacebookAuthProvider.credential(accessToken.tokenString);

      await _auth.signInWithCredential(credential);
      await FirebaseService.logLogin('facebook');

      return const AuthResult.success(message: 'Signed in with Facebook');
    } catch (error) {
      _handleError(error);
      return AuthResult.error(AuthException.fromFirebaseAuthException(error));
    }
  }

  /// Send password reset email
  Future<AuthResult> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return AuthResult.success(message: 'Password reset email sent to $email');
    } catch (error) {
      return AuthResult.error(AuthException.fromFirebaseAuthException(error));
    }
  }

  /// Send email verification
  Future<AuthResult> sendEmailVerification() async {
    try {
      final user = _auth.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        return AuthResult.success(message: 'Verification email sent');
      }
      return AuthResult.error(const AuthException('No user found or email already verified'));
    } catch (error) {
      return AuthResult.error(AuthException.fromFirebaseAuthException(error));
    }
  }

  /// Reload user to check email verification
  Future<void> reloadUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        await user.reload();
        final updatedUser = _auth.currentUser;
        if (updatedUser?.emailVerified == true) {
          await _handleAuthStateChange(updatedUser);
        }
      }
    } catch (error) {
      _handleError(error);
    }
  }

  /// Update user profile
  Future<AuthResult> updateProfile(UserModel updatedUser) async {
    try {
      state = const AuthState.authenticating(message: 'Updating profile...');

      // Update Firebase Auth profile
      final firebaseUser = _auth.currentUser;
      if (firebaseUser != null) {
        await firebaseUser.updateDisplayName(updatedUser.displayName);
      }

      // Update Firestore document
      await _firestore
          .collection('users')
          .doc(updatedUser.id)
          .set(updatedUser.toJson());

      state = AuthState.authenticated(updatedUser);
      return const AuthResult.success(message: 'Profile updated successfully');
    } catch (error) {
      _handleError(error);
      return AuthResult.error(AuthException.fromFirebaseAuthException(error));
    }
  }

  /// Sign out
  Future<void> signOut() async {
    try {
      state = const AuthState.authenticating(message: 'Signing out...');

      // Sign out from all providers
      if (await _googleSignIn.isSignedIn()) {
        await _googleSignIn.signOut();
      }
      await FacebookAuth.instance.logOut();
      await _auth.signOut();

      state = const AuthState.unauthenticated();
    } catch (error) {
      _handleError(error);
    }
  }
}

/// Authentication controller for UI interactions
class AuthController {
  AuthController(this._notifier);

  final AuthNotifier _notifier;

  Future<AuthResult> signInWithPhone(String phoneNumber) =>
      _notifier.signInWithPhone(phoneNumber);

  Future<AuthResult> verifyOTP(String verificationId, String otp) =>
      _notifier.verifyOTP(verificationId, otp);

  Future<AuthResult> signInWithEmail(String email, String password) =>
      _notifier.signInWithEmail(email, password);

  Future<AuthResult> signUpWithEmail(String email, String password, String displayName) =>
      _notifier.signUpWithEmail(email, password, displayName);

  Future<AuthResult> signInWithGoogle() => _notifier.signInWithGoogle();

  Future<AuthResult> signInWithFacebook() => _notifier.signInWithFacebook();

  Future<AuthResult> sendPasswordResetEmail(String email) =>
      _notifier.sendPasswordResetEmail(email);

  Future<AuthResult> sendEmailVerification() => _notifier.sendEmailVerification();

  Future<void> reloadUser() => _notifier.reloadUser();

  Future<AuthResult> updateProfile(UserModel user) => _notifier.updateProfile(user);

  Future<void> signOut() => _notifier.signOut();
}
