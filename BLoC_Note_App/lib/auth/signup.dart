import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_operations/models/user_model.dart';

import 'package:firebase_auth/firebase_auth.dart';

class RegisterService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createUser(
      String email, String password, String confirmPassword) async {
    // Create a new user with email and password

    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }
  // Get the newly created user's UID
  /*   String uid = userCredential.user!.uid; */ // (anlık kullanıcı id'si)

  // Add the user to the users collection in Firestore

  Future<void> storeUserInfoToFirebase(UserModel userModel) async {
    final CollectionReference users = _firestore.collection('users');
    //  Şu anda oturum açmış olan kullanıcıyı alın

    userModel.userId = _auth.currentUser!.uid;

    await users.doc(userModel.userId).set(userModel.toMap());
  }
}

/*  await users.doc(uid).set({
      "username": username,
      "userId": uid,
      "email": email,
    }) */

/* await users.add({
    "username": username,
    "userId": uid,
    "email": email,
  });



 */
/* class RegisterService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createUser(String username, String email, String password,
      String confirmPassword) async {
    // Create a new user with email and password

    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    // Get the newly created user's UID
    String uid = userCredential.user!.uid;

    final CollectionReference users = _firestore.collection('users');
    // Add the user to the users collection in Firestore
    await users.doc(uid).set({
      "username": username,
      "userId": userCredential.user!.uid,
      "email": email,
    });
  }
}
 */