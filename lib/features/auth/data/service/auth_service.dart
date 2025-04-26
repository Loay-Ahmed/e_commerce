import 'package:firebase_auth/firebase_auth.dart';
import '../model/user.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    final res = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (res.user != null) {
      UserModel.fromInstance(res.user!);
    } else {
      throw Exception("Sign In failed");
    }
  }

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    final res = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (res.user != null) {
      UserModel.fromInstance(res.user!);
    } else {
      throw Exception("Sign Up failed");
    }
  }

  Future<void> forgotPassword(String email, String password) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {}
  }

  Future<void> checkCode(String code, String email) async {
    try {
      await _auth.verifyPasswordResetCode(code);
    } catch (e) {}
  }

  Future<void> resetPassword(String code, String password) async {
    await _auth.confirmPasswordReset(code: code, newPassword: password);
  }
}
