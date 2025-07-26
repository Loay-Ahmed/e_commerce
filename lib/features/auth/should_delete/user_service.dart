// import 'package:cloud_firestore/cloud_firestore.dart';

// import '../../should_delete/user_model.dart';

// class UserService {
//   final _firestore = FirebaseFirestore.instance;

//   Future<void> createUser({
//     required String uid,
//     required String email,
//     String? displayName,
//     String? photoUrl,
//   }) async {
//     await _firestore.collection("users").doc(uid).set({
//       'uid': uid,
//       'email': email,
//       'displayName': displayName ?? '',
//       'photoUrl': photoUrl ?? '',
//       'createdAt': FieldValue.serverTimestamp(),
//       'lastLogin': FieldValue.serverTimestamp(),
//     });
//   }

//   Future<Map<String, dynamic>?> getCurrentUser(String uid) async {
//     final doc = await _firestore.collection("users").doc(uid).get();
//     return doc.data();
//   }

//   Future<void> updateUserData(UserModel user) async {
//     await _firestore.collection("users").doc(user.uid).update(user.toJson());
//   }

//   Future<void> deleteUser(String uid) async {
//     await _firestore.collection("users").doc(uid).delete();
//   }
// }
