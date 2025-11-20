// lib/core/providers/auth_provider.dart - FIXED VERSION
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter/foundation.dart';

import '../../data/models/user_model.dart';
import '../../services/firebase_service.dart';
import '../../services/notification_service.dart';

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
        debugPrint('Auth state changed: ${user?.uid}');
        if (user != null) {
          await _loadUserData(user);
        } else {
          state = const AsyncValue.data(null);
        }
      }, onError: (error) {
        debugPrint('Auth state changes error: $error');
        state = AsyncValue.error(error, StackTrace.current);
      });

      // Check current user
      final currentUser = _auth.currentUser;
      if (currentUser != null) {
        await _loadUserData(currentUser);
      } else {
        state = const AsyncValue.data(null);
      }
    } catch (e, stackTrace) {
      debugPrint('Auth init error: $e');
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> _loadUserData(User firebaseUser) async {
    try {
      debugPrint('Loading user data for: ${firebaseUser.uid}');

      final userDoc = await _firestore
          .collection('users')
          .doc(firebaseUser.uid)
          .get();

      UserModel user;
      if (userDoc.exists && userDoc.data() != null) {
        // User document exists, load data
        final userData = userDoc.data()!;
        user = UserModel.fromJson({
          'id': firebaseUser.uid,
          ...userData,
        });
        debugPrint('Loaded existing user: ${user.displayName}');
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

        debugPrint('Created new user: ${user.displayName}');
      }

      // Set user ID for analytics
      await FirebaseService.setUserId(user.id);

      state = AsyncValue.data(user);
    } catch (e, stackTrace) {
      debugPrint('Load user data error: $e');
      state = AsyncValue.error(e, stackTrace);
    }
  }

  // Phone Authentication
  Future<void> signInWithPhoneNumber(String phoneNumber) async {
    try {
      debugPrint('Starting phone auth for: $phoneNumber');

      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          debugPrint('Phone verification auto-completed');
          await _signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          debugPrint('Phone verification failed: ${e.code} - ${e.message}');
          throw Exception(_getAuthErrorMessage(e.code));
        },
        codeSent: (String verificationId, int? resendToken) {
          debugPrint('Code sent, verification ID: $verificationId');
          _verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          debugPrint('Code auto-retrieval timeout: $verificationId');
          _verificationId = verificationId;
        },
        timeout: const Duration(seconds: 60),
      );
    } catch (e) {
      debugPrint('Phone auth error: $e');
      state = AsyncValue.error(e, StackTrace.current);
      rethrow;
    }
  }

  Future<void> verifyOTP(String verificationId, String otp) async {
    try {
      debugPrint('Verifying OTP: $otp');

      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );

      await _signInWithCredential(credential);
      await FirebaseService.logLogin('phone');
    } catch (e) {
      debugPrint('OTP verification error: $e');
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
      debugPrint('Signing in with email: $email');

      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null && credential.user!.email != null && !credential.user!.emailVerified) {
        await _auth.signOut();
        throw Exception('Please verify your email before signing in');
      }

      await FirebaseService.logLogin('email');
    } catch (e) {
      debugPrint('Email sign in error: $e');
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
      debugPrint('Signing up with email: $email');

      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        await credential.user!.updateDisplayName(displayName);
        await credential.user!.sendEmailVerification();
        await FirebaseService.logSignUp('email');
      }
    } catch (e) {
      debugPrint('Email sign up error: $e');
      state = AsyncValue.error(e, StackTrace.current);
      rethrow;
    }
  }

  // Google Sign In
  Future<void> signInWithGoogle() async {
    try {
      debugPrint('Starting Google sign in');

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        debugPrint('Google sign in cancelled');
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _signInWithCredential(credential);
      await FirebaseService.logLogin('google');
    } catch (e) {
      debugPrint('Google sign in error: $e');
      state = AsyncValue.error(e, StackTrace.current);
      rethrow;
    }
  }

  // Facebook Sign In
  Future<void> signInWithFacebook() async {
    try {
      debugPrint('Starting Facebook sign in');

      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;

        String token;
        try {
          token = accessToken.tokenString;
        } catch (e) {
          token = (accessToken as dynamic).token;
        }

        final credential = FacebookAuthProvider.credential(token);
        await _signInWithCredential(credential);
        await FirebaseService.logLogin('facebook');
      } else {
        throw Exception('Facebook sign in cancelled or failed');
      }
    } catch (e) {
      debugPrint('Facebook sign in error: $e');
      state = AsyncValue.error(e, StackTrace.current);
      rethrow;
    }
  }

  Future<void> _signInWithCredential(AuthCredential credential) async {
    try {
      debugPrint('Signing in with credential');
      final userCredential = await _auth.signInWithCredential(credential);
      debugPrint('Credential sign in successful: ${userCredential.user?.uid}');
    } catch (e) {
      debugPrint('Credential sign in error: $e');
      rethrow;
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
        final updatedUser = _auth.currentUser;
        if (updatedUser != null && updatedUser.emailVerified) {
          await _loadUserData(updatedUser);
        }
      }
    } catch (e) {
      debugPrint('Reload user error: $e');
    }
  }

  Future<void> updateProfile(UserModel updatedUser) async {
    try {
      debugPrint('Updating profile for: ${updatedUser.id}');

      // Update Firebase Auth profile
      final firebaseUser = _auth.currentUser;
      if (firebaseUser != null) {
        if (firebaseUser.displayName != updatedUser.displayName) {
          await firebaseUser.updateDisplayName(updatedUser.displayName);
          debugPrint('Updated Firebase Auth display name');
        }
      }

      // Convert to JSON and handle nested objects properly
      final userData = updatedUser.toJson();

      // Convert Timestamp objects to proper format for Firestore
      final Map<String, dynamic> firestoreData = {
        'phoneNumber': userData['phoneNumber'],
        'email': userData['email'],
        'displayName': userData['displayName'],
        'profileImage': userData['profileImage'],
        'userType': userData['userType'],
        'addresses': userData['addresses'] ?? [],
        'preferences': {
          'language': updatedUser.preferences.language,
          'currency': updatedUser.preferences.currency,
          'notifications': {
            'push': updatedUser.preferences.notifications.push,
            'sms': updatedUser.preferences.notifications.sms,
            'email': updatedUser.preferences.notifications.email,
            'orderUpdates': updatedUser.preferences.notifications.orderUpdates,
            'promotions': updatedUser.preferences.notifications.promotions,
          },
        },
        'createdAt': updatedUser.createdAt,
        'updatedAt': updatedUser.updatedAt,
        'lastLoginAt': updatedUser.lastLoginAt,
      };

      debugPrint('Saving Firestore data: $firestoreData');

      await _firestore
          .collection('users')
          .doc(updatedUser.id)
          .set(firestoreData);

      // Update state immediately
      state = AsyncValue.data(updatedUser);
      debugPrint('Profile updated successfully in provider');
    } catch (e, stackTrace) {
      debugPrint('Update profile error: $e');
      debugPrint('Stack trace: $stackTrace');
      state = AsyncValue.error(e, stackTrace);
      throw Exception('Failed to update profile: $e');
    }
  }

  // Sign Out
  Future<void> signOut() async {
    try {
      debugPrint('Signing out');

      // Sign out from all providers
      if (await _googleSignIn.isSignedIn()) {
        await _googleSignIn.signOut();
      }
      await FacebookAuth.instance.logOut();
      await _auth.signOut();

      state = const AsyncValue.data(null);
      debugPrint('Sign out successful');
    } catch (e) {
      debugPrint('Sign out error: $e');
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
