import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_operations/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreProfileService {
  final CollectionReference<Map<String, dynamic>> profiles =
      FirebaseFirestore.instance.collection("users");
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // CREATE

  Future addProfile(UserModel userModel) async {
    userModel.userId = _auth.currentUser!.uid;
    await profiles.doc(userModel.userId).set(userModel.toMap());
  }

  // READ

// READ with Stream

  Stream<UserModel?> getProfile() {
    return profiles.doc(_auth.currentUser!.uid).snapshots().map((snapshot) {
      if (snapshot.exists) {
        return UserModel.fromMap(snapshot.data()!);
      } else {
        return null;
      }
    });
  }

/*   Future<UserModel?> getProfile() async {
    final snapshot = await profiles.doc(_auth.currentUser!.uid).get();
    if (snapshot.exists) {
      return UserModel.fromMap(snapshot.data()!);
    } else {
      return null;
    }
  } */

  // UPDATE

  Future updateProfile(UserModel userModel) async {
    await profiles.doc(userModel.userId).update(userModel.toMap());
  }
}
