import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> authenticateWithEmailAndPassword(String email, String password, {bool signUp = false}) async {
    try {
      UserCredential credential;
      if (signUp) {
        credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      } else {
        credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      }
      return credential.user;
    } catch (e) {
      print("Error occurred: $e");
      return null;
    }
  }
}
