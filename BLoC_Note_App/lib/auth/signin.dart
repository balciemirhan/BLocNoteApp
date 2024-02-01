import 'package:firebase_auth/firebase_auth.dart';

class LoginService {
  /*  final FirebaseFirestore _firestore = FirebaseFirestore.instance; */
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> loginUser(String email, String password) async {
    // Create a new user with email and password
    await _auth.signInWithEmailAndPassword(email: email, password: password);

    /*   // Get the newly created user's UID
    String uid = userCredential.user!.uid;

    final CollectionReference users = _firestore.collection('users');
    // Add the user to the users collection in Firestore
    await users.doc(uid).set(user.toMap()); */
  }
}
