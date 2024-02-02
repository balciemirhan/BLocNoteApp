import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> loginUser(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> createUser(
      String email, String password, String confirmPassword) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> userOut() async {
    await _auth.signOut();
  }
}
