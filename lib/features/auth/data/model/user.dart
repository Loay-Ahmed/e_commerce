import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  late final String? name;
  late final String email;
  late final String? phone;

  UserModel.fromInstance(User user) {
    name = user.displayName;
    email = user.email!;
    phone = user.phoneNumber;
  }
}
