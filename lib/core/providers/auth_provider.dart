// lib/core/providers/auth_provider.dart - FIXED VERSION
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../models/user_model.dart';
import '../services/firebase_service.dart';
import '../services/notification_service.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AsyncValue<UserModel?>>(
      (ref) => AuthNotifier(),
);

class AuthNotifier extends StateNotifier<AsyncValue<UserModel?>> {
  AuthNotifier() : super(const AsyncValue.loading()) {
    _init();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  String? _verificationId;

  Future<void> _init() async {
    try {
      // Listen to auth state changes
      _auth.authStateChanges().listen((User? user) async {
        if (user != null) {
          // User is signed in, fetch user data from Firestore
          await _loadUserData(user);
        } else {
          // User is signed out
          state = const AsyncValue.data(null);
        }
      });

      // Check if user is already signed in
      final currentUser = _auth.currentUser;
      if (currentUser != null) {
        await _loadUserData(currentUser);
      } else {
        state = const AsyncValue.data(null);
      }
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> _loadUserData(User firebaseUser) async {
    try {
      final userDoc = await _firestore
          .collection('users')
          .doc(firebaseUser.uid)
          .get();

      UserModel user;
      if (userDoc.exists) {
        // User document exists, load data
        user = UserModel.fromJson({
          'id': firebaseUser.uid,
          ...userDoc.data()!,
        });
      } else {
        // New user, create document with basic info
        user = UserModel(
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
            .set(user.toJson());
      }

      // Set user ID for analytics and get FCM token
      await FirebaseService.setUserId(user.id);

      // Get FCM token for notifications
      final fcmToken = await NotificationService.getToken();
      if (fcmToken != null) {
        // TODO: Save FCM token to user document if needed
      }

      state = AsyncValue.data(user);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  // Phone Authentication
  Future<void> signInWithPhoneNumber(String phoneNumber) async {
    try {
      state = const AsyncValue.loading();

      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Auto-verification (Android only)
          await _signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          throw Exception(_getAuthErrorMessage(e.code));
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
          // Navigation will be handled by the UI
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
        },
      );
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      rethrow;
    }
  }

  Future<void> verifyOTP(String verificationId, String otp) async {
    try {
      state = const AsyncValue.loading();

      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );

      await _signInWithCredential(credential);
      await FirebaseService.logLogin('phone');
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      rethrow;
    }
  }

  // Email Authentication
  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      state = const AsyncValue.loading();

      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null && !credential.user!.emailVerified) {
        await _auth.signOut();
        throw Exception('Please verify your email before signing in');
      }

      await FirebaseService.logLogin('email');
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      rethrow;
    }
  }

  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required String displayName,
  }) async {
    try {
      state = const AsyncValue.loading();

      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        // Update display name
        await credential.user!.updateDisplayName(displayName);

        // Send email verification
        await credential.user!.sendEmailVerification();

        await FirebaseService.logSignUp('email');
      }
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      rethrow;
    }
  }

  // Google Sign In
  Future<void> signInWithGoogle() async {
    try {
      state = const AsyncValue.loading();

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        state = const AsyncValue.data(null);
        return;
      }

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _signInWithCredential(credential);
      await FirebaseService.logLogin('google');
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      rethrow;
    }
  }

  // Facebook Sign In
  Future<void> signInWithFacebook() async {
    try {
      state = const AsyncValue.loading();

      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;

        // Handle different versions of flutter_facebook_auth
        String token;
        try {
          // Try tokenString first (newer versions)
          token = accessToken.tokenString;
        } catch (e) {
          // Fallback to token (older versions)
          token = (accessToken as dynamic).token;
        }

        final credential = FacebookAuthProvider.credential(token);

        await _signInWithCredential(credential);
        await FirebaseService.logLogin('facebook');
      } else {
        state = const AsyncValue.data(null);
        throw Exception('Facebook sign in cancelled or failed');
      }
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      rethrow;
    }
  }

  Future<void> _signInWithCredential(AuthCredential credential) async {
    final userCredential = await _auth.signInWithCredential(credential);
    if (userCredential.user != null) {
      // User data will be loaded automatically by authStateChanges listener
    }
  }

  // Password Reset
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw Exception(_getAuthErrorMessage(e.toString()));
    }
  }

  // Email Verification
  Future<void> sendEmailVerification() async {
    try {
      final user = _auth.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
      }
    } catch (e) {
      throw Exception('Failed to send verification email');
    }
  }

  Future<void> reloadUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        await user.reload();
        if (user.emailVerified) {
          await _loadUserData(user);
        }
      }
    } catch (e) {
      // Ignore reload errors
    }
  }

  // Update Profile
  Future<void> updateProfile(UserModel updatedUser) async {
    try {
      await _firestore
          .collection('users')
          .doc(updatedUser.id)
          .set(updatedUser.toJson(), SetOptions(merge: true));

      state = AsyncValue.data(updatedUser);
    } catch (e) {
      throw Exception('Failed to update profile: $e');
    }
  }

  // Sign Out
  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await FacebookAuth.instance.logOut();
      await _auth.signOut();
      state = const AsyncValue.data(null);
    } catch (e) {
      throw Exception('Failed to sign out: $e');
    }
  }

  String _getAuthErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'user-not-found':
        return 'No user found with this email address';
      case 'wrong-password':
        return 'Incorrect password';
      case 'email-already-in-use':
        return 'An account already exists with this email';
      case 'weak-password':
        return 'Password is too weak';
      case 'invalid-email':
        return 'Invalid email address';
      case 'user-disabled':
        return 'This account has been disabled';
      case 'too-many-requests':
        return 'Too many failed attempts. Please try again later';
      case 'invalid-phone-number':
        return 'Invalid phone number format';
      case 'invalid-verification-code':
        return 'Invalid verification code';
      case 'session-expired':
        return 'Verification session expired. Please try again';
      default:
        return 'Authentication failed. Please try again';
    }
  }
}