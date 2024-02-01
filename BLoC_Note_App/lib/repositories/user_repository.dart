import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_operations/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> storeUserInfoToFirebase(UserModel userModel) async {
    final CollectionReference users = _firestore.collection('users');

    userModel.userId = _auth.currentUser!.uid;

    await users.doc(userModel.userId).set(userModel.toMap());
  }
}
