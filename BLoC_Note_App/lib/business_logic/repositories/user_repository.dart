import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_operations/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser(UserModel userModel) async {
    final CollectionReference users = _firestore.collection('users');

    userModel.userId = _auth.currentUser!.uid;

    await users.doc(userModel.userId).set(userModel.toMap());
  }

// getUser fonksiyonu, verilen UserModel nesnesini kullanarak Firebase Firestore'dan bir kullanıcıyı getirir.

  Future<UserModel> getUser(UserModel userModel) async {
    final CollectionReference<Map<String, dynamic>> users =
        _firestore.collection('users');

    userModel.userId = _auth.currentUser!.uid;

    final snapshot = await users.doc(userModel.userId).get();

    if (snapshot.exists) {
      return UserModel.fromMap(snapshot.data()!);
    } else {
      throw Exception("Error");
    }
  }

  Future<void> updateUser(UserModel userModel) async {
    final CollectionReference users = _firestore.collection('users');

    userModel.userId = _auth.currentUser!.uid;

    await users.doc(userModel.userId).update(userModel.toMap());
  }

  Future<void> deleteUser(UserModel userModel) async {
    final CollectionReference users = _firestore.collection('users');

    userModel.userId = _auth.currentUser!.uid;

    await users.doc(userModel.userId).delete();
  }
}
