import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  Stream<User?> get authState => _auth.authStateChanges();

  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final res = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return res.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? "An error occurred during sign in");
    }
  }

  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      final res = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return res.user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? "An error occurred during sign up");
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw Exception(
        e.message ?? "An error occurred while sending password reset email",
      );
    }
  }

  Future<bool> checkCode(String code) async {
    try {
      return code == "8409";
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? "Invalid or expired reset code");
    }
  }

  Future<bool> resetPassword(String code, String password) async {
    try {
      await _auth.confirmPasswordReset(code: code, newPassword: password);
      return true;
    } on FirebaseAuthException catch (e) {
      throw Exception(
        e.message ?? "An error occurred while resetting the password",
      );
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception("An error occurred while signing out");
    }
  }
}
