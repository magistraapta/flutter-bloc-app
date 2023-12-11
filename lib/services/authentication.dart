
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/models/user_model.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserModel?> signUpUser(String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      final User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        return UserModel(
            displayName: firebaseUser.displayName,
            email: firebaseUser.email,
            uid: firebaseUser.uid);
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<void> signOutUser() async {
    final User? firebaseUser = _firebaseAuth.currentUser;
    if (firebaseUser != null) {
      await _firebaseAuth.signOut();
    }
  }
}
