import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mentorship/core/networking/firebase/firebase_error_model.dart';
import 'package:mentorship/core/networking/firebase/firebase_result.dart';

class LogoutRepo {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<FirebaseResult> logout() async {
    try {
      await auth.signOut();
      return FirebaseResult.success('Success');
    } on FirebaseAuthException catch (error) {
      return FirebaseResult.fail(
        FirebaseErrorModel(
          message: error.message!,
          code: error.code,
        ),
      );
    }
  }

  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<FirebaseResult> googleLogout() async {
    try {
      await googleSignIn.signOut();
      return FirebaseResult.success('Success');
    } on FirebaseAuthException catch (error) {
      return FirebaseResult.fail(
        FirebaseErrorModel(
          message: error.message!,
          code: error.code,
        ),
      );
    }
  }
}
