// import 'package:firebase_auth/firebase_auth.dart';

// class UserModel {
//   final String uid;
//   final String email;
//   final String? displayName;
//   final String? photoUrl;
//   final DateTime createdAt;

//   UserModel({
//     required this.uid,
//     required this.email,
//     this.displayName,
//     this.photoUrl,
//     required this.createdAt,
//   });

//   factory UserModel.fromFirebase(User user) {
//     return UserModel(
//       uid: user.uid,
//       email: user.email!,
//       displayName: user.displayName,
//       photoUrl: user.photoURL,
//       createdAt: DateTime.now(),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'uid': uid,
//       'email': email,
//       'displayName': displayName,
//       'photoUrl': photoUrl,
//       'createdAt': createdAt.toIso8601String(),
//     };
//   }
// }
