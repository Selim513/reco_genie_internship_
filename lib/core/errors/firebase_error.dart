import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseError {
  //Login
  static String getLoginErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'password or the email address is incorrect';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'invalid-email':
        return 'Please enter a valid email address.';
      case 'user-disabled':
        return 'This account has been disabled.';
      case 'too-many-requests':
        return 'Too many failed attempts. Please try again later.';
      case 'invalid-credential':
        return 'Password or the email address is incorrect.';
      case 'network-request-failed':
        return 'Network error. Please check your internet connection.';
      default:
        if (e.message != null) {
          if (e.message!.contains('credential')) {
            return 'Invalid email or password. Please check your credentials.';
          } else if (e.message!.contains('email')) {
            return 'Please enter a valid email address.';
          }
          return e.message!;
        }
        return 'Login failed. Please try again.';
    }
  }

  //-register
  static String getRegisterErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return 'The password provided is too weak.';
      case 'email-already-in-use':
        return 'The account already exists for that email.';
      case 'invalid-email':
        return 'The email address is not valid.';
      default:
        return e.message ?? 'Registration failed. Please try again.';
    }
  }
}
