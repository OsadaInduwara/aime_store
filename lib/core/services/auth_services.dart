// lib/core/services/auth_service.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../models/user_model.dart';
import '../utils/app_constants.dart';
import '../exceptions/auth_exceptions.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Current user stream
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Get current user
  User? get currentUser => _auth.currentUser;

  // PHONE NUMBER AUTHENTICATION
  Future<void> signInWithPhoneNumber(String phoneNumber) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Auto-verification (Android only)
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          throw AuthException.fromFirebaseAuthException(e);
        },
        codeSent: (String verificationId, int? resendToken) {
          // Store verification ID for later use
          // This will be handled by the UI layer
        },
        timeout: const Duration(seconds: AppConstants.otpTimeoutSeconds),
        codeAutoRetrievalTimeout: (String verificationId) {
          // Auto-retrieval timeout callback
        },
      );
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromFirebaseAuthException(e);
    } catch (e) {
      throw AuthException('Failed to send OTP: ${e.toString()}');
    }
  }

  // Verify OTP
  Future<UserModel?> verifyOTP(String verificationId, String otp) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      return await _handleAuthResult(userCredential);
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromFirebaseAuthException(e);
    } catch (e) {
      throw AuthException('Failed to verify OTP: ${e.toString()}');
    }
  }

  // EMAIL & PASSWORD AUTHENTICATION
  Future<UserModel?> signUpWithEmail({
    required String email,
    required String password,
    required String displayName,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        await userCredential.user!.updateDisplayName(displayName);
        await userCredential.user!.sendEmailVerification();
      }

      return await _handleAuthResult(userCredential);
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromFirebaseAuthException(e);
    } catch (e) {
      throw AuthException('Failed to create account: ${e.toString()}');
    }
  }

  Future<UserModel?> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return await _handleAuthResult(userCredential);
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromFirebaseAuthException(e);
    } catch (e) {
      throw AuthException('Failed to sign in: ${e.toString()}');
    }
  }

  // GOOGLE AUTHENTICATION
  Future<UserModel?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        throw AuthException('Google sign in was cancelled');
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      final userCredential = await _auth.signInWithCredential(credential);
      return await _handleAuthResult(userCredential);
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromFirebaseAuthException(e);
    } catch (e) {
      throw AuthException('Failed to sign in with Google: ${e.toString()}');
    }
  }

  // FACEBOOK AUTHENTICATION
  Future<UserModel?> signInWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        // Get the access token - Fixed the token access
        final accessToken = result.accessToken;
        if (accessToken == null) {
          throw AuthException('Failed to get Facebook access token');
        }

        // Create a credential from the access token
        final OAuthCredential credential = FacebookAuthProvider.credential(
          accessToken.tokenString, // Use tokenString property
        );

        // Once signed in, return the UserCredential
        final userCredential = await _auth.signInWithCredential(credential);
        return await _handleAuthResult(userCredential);
      } else if (result.status == LoginStatus.cancelled) {
        throw AuthException('Facebook sign in was cancelled');
      } else {
        throw AuthException('Facebook sign in failed: ${result.message}');
      }
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromFirebaseAuthException(e);
    } catch (e) {
      throw AuthException('Failed to sign in with Facebook: ${e.toString()}');
    }
  }

  // PASSWORD RESET
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromFirebaseAuthException(e);
    } catch (e) {
      throw AuthException('Failed to send password reset email: ${e.toString()}');
    }
  }

  // EMAIL VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      final user = _auth.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
      }
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromFirebaseAuthException(e);
    } catch (e) {
      throw AuthException('Failed to send email verification: ${e.toString()}');
    }
  }

  Future<void> reloadUser() async {
    await _auth.currentUser?.reload();
  }

  // UPDATE PASSWORD
  Future<void> updatePassword(String newPassword) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        await user.updatePassword(newPassword);
      }
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromFirebaseAuthException(e);
    } catch (e) {
      throw AuthException('Failed to update password: ${e.toString()}');
    }
  }

  // REAUTHENTICATION
  Future<void> reauthenticateWithPassword(String password) async {
    try {
      final user = _auth.currentUser;
      if (user != null && user.email != null) {
        final credential = EmailAuthProvider.credential(
          email: user.email!,
          password: password,
        );
        await user.reauthenticateWithCredential(credential);
      }
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromFirebaseAuthException(e);
    } catch (e) {
      throw AuthException('Failed to reauthenticate: ${e.toString()}');
    }
  }

  // DELETE ACCOUNT
  Future<void> deleteAccount() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        // Delete user data from Firestore
        await _firestore.collection('users').doc(user.uid).delete();

        // Delete the user account
        await user.delete();
      }
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromFirebaseAuthException(e);
    } catch (e) {
      throw AuthException('Failed to delete account: ${e.toString()}');
    }
  }

  // SIGN OUT
  Future<void> signOut() async {
    try {
      // Sign out from Google if signed in
      if (await _googleSignIn.isSignedIn()) {
        await _googleSignIn.signOut();
      }

      // Sign out from Facebook
      await FacebookAuth.instance.logOut();

      // Sign out from Firebase
      await _auth.signOut();
    } catch (e) {
      throw AuthException('Failed to sign out: ${e.toString()}');
    }
  }

  // LINK ACCOUNTS
  Future<void> linkWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        throw AuthException('Google sign in was cancelled');
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.currentUser?.linkWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'credential-already-in-use') {
        throw AuthException('This Google account is already linked to another user');
      }
      throw AuthException.fromFirebaseAuthException(e);
    } catch (e) {
      throw AuthException('Failed to link Google account: ${e.toString()}');
    }
  }

  Future<void> linkWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        // Get the access token - Fixed the token access
        final accessToken = result.accessToken;
        if (accessToken == null) {
          throw AuthException('Failed to get Facebook access token');
        }

        final OAuthCredential credential = FacebookAuthProvider.credential(
          accessToken.tokenString, // Use tokenString property
        );

        await _auth.currentUser?.linkWithCredential(credential);
      } else {
        throw AuthException('Facebook authentication failed');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'credential-already-in-use') {
        throw AuthException('This Facebook account is already linked to another user');
      }
      throw AuthException.fromFirebaseAuthException(e);
    } catch (e) {
      throw AuthException('Failed to link Facebook account: ${e.toString()}');
    }
  }

  // UNLINK ACCOUNTS
  Future<void> unlinkProvider(String providerId) async {
    try {
      await _auth.currentUser?.unlink(providerId);
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromFirebaseAuthException(e);
    } catch (e) {
      throw AuthException('Failed to unlink provider: ${e.toString()}');
    }
  }

  // PRIVATE METHODS
  Future<UserModel?> _handleAuthResult(UserCredential userCredential) async {
    final user = userCredential.user;
    if (user == null) return null;

    // Check if user profile exists
    final userDoc = await _firestore.collection('users').doc(user.uid).get();

    if (userDoc.exists) {
      final userData = userDoc.data()!;
      return UserModel.fromJson({
        'id': user.uid,
        ...userData,
      });
    } else {
      // Create new user profile
      final newUser = UserModel(
        id: user.uid,
        phoneNumber: user.phoneNumber ?? '',
        email: user.email,
        displayName: user.displayName ?? 'User',
        profileImage: user.photoURL,
        preferences: const UserPreferences(),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        lastLoginAt: DateTime.now(),
      );

      await _firestore.collection('users').doc(user.uid).set(newUser.toJson());
      return newUser;
    }
  }

  // Update user profile
  Future<void> updateUserProfile(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.id).update(
        user.copyWith(updatedAt: DateTime.now()).toJson(),
      );
    } catch (e) {
      throw AuthException('Failed to update profile: ${e.toString()}');
    }
  }

  // Get user profile
  Future<UserModel?> getUserProfile(String userId) async {
    try {
      final doc = await _firestore.collection('users').doc(userId).get();
      if (doc.exists) {
        return UserModel.fromJson({
          'id': userId,
          ...doc.data()!,
        });
      }
      return null;
    } catch (e) {
      throw AuthException('Failed to get user profile: ${e.toString()}');
    }
  }

  // Check if email is available
  Future<bool> isEmailAvailable(String email) async {
    try {
      final methods = await _auth.fetchSignInMethodsForEmail(email);
      return methods.isEmpty;
    } catch (e) {
      return false;
    }
  }

  // Get linked providers
  List<String> getLinkedProviders() {
    final user = _auth.currentUser;
    if (user == null) return [];

    return user.providerData.map((info) => info.providerId).toList();
  }
}