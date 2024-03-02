import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepository {
  final FirebaseAuth authInstance;
  FirebaseAuthRepository({required this.authInstance});

  Stream<User?> get onAuthStageChanged => authInstance.authStateChanges();

  Future<bool> verifyUser(String email, String password) async {
    try {
      await authInstance.signInWithEmailAndPassword(
          email: email, password: password);
      return true;
    } catch (e) {
      return false;
    }
  }

  User? getUser() {
    return authInstance.currentUser;
  }
}
