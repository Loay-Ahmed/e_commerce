import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/auth/data/model/user.dart';
import 'package:e_commerce/features/auth/data/service/storage_service.dart';
import '../data/service/auth_service.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService authService;
  final StorageService storageService;

  // Constructor
  AuthCubit(this.authService, this.storageService) : super(AuthInitial()) {
    authService.authState.listen((user) {
      if (user != null) {
        emit(Authenticated(UserModel.fromFirebase(user)));
      }
    });
  }

  // Login/SignIn into account
  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final user = await authService.signInWithEmailAndPassword(
        email,
        password,
      );
      if (user != null) {
        emit(Authenticated(UserModel.fromFirebase(user)));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

//Sign Up new user
  Future<void> signUp(String name, String email, String password) async {
    emit(AuthLoading());
    try {
      final user = await authService.signUpWithEmailAndPassword(
        email,
        password,
      );
      user?.updateDisplayName(name);
      emit(SignedUp());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  //send reset password email
  Future<void> forgotPassword(String email) async {
    await authService.forgotPassword(email);
  }

  //check entered code
  Future<void> checkCode(String code) async {
    await authService.checkCode(code);
  }

  //Update password
  Future<void> resetPassword(String code, String password) async {
    await authService.resetPassword(code, password);
    emit(PasswordResetSuccessful());
  }

  // Logout/SignOut function
  Future<void> logout() async {
    emit(AuthLoading());
    try {
      await authService.signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
