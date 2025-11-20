// lib/core/exceptions/auth_exceptions.dart
import 'package:firebase_auth/firebase_auth.dart';

class AuthException implements Exception {
  final String message;
  final String? code;

  const AuthException(this.message, [this.code]);

  factory AuthException.fromFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return const AuthException('No user found with this email address.');
      case 'wrong-password':
        return const AuthException('Incorrect password.');
      case 'email-already-in-use':
        return const AuthException('An account already exists with this email address.');
      case 'weak-password':
        return const AuthException('Password is too weak. Please choose a stronger password.');
      case 'invalid-email':
        return const AuthException('Invalid email address.');
      case 'user-disabled':
        return const AuthException('This account has been disabled.');
      case 'too-many-requests':
        return const AuthException('Too many failed attempts. Please try again later.');
      case 'operation-not-allowed':
        return const AuthException('This sign-in method is not enabled.');
      case 'invalid-credential':
        return const AuthException('Invalid credentials provided.');
      case 'credential-already-in-use':
        return const AuthException('This account is already linked to another user.');
      case 'requires-recent-login':
        return const AuthException('Please sign in again to complete this action.');
      case 'invalid-verification-code':
        return const AuthException('Invalid verification code.');
      case 'invalid-verification-id':
        return const AuthException('Invalid verification ID.');
      case 'session-expired':
        return const AuthException('The verification session has expired.');
      default:
        return AuthException(e.message ?? 'An unknown error occurred.');
    }
  }

  @override
  String toString() => message;
}
