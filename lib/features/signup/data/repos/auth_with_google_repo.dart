import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mentorship/core/networking/api_result.dart';
import 'package:mentorship/features/signup/data/models/user_model.dart';

class AuthWithGoogleRepo {
  Future<ApiResult<UserModel>> authWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return const ApiResult.failure('Google Signup was cancelled by user');
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      UserModel userModel = UserModel.fromFirebaseUser(userCredential.user!);
      return ApiResult.success(userModel);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}