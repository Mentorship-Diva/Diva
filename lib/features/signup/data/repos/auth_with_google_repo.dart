import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mentorship/core/helpers/shared_prefrances_helper.dart';
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



      print('XXXX');


      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      print(userCredential.user!.email);

      UserModel userModel = UserModel.fromFirebaseUser(userCredential.user!);
      // await SharedPreferencesHelper.setData('isGoogleSignIn', true);
      await SharedPreferencesHelper.setData('userEmail', userModel.email);
      await SharedPreferencesHelper.setData('userName', userModel.displayName);
      await SharedPreferencesHelper.setData('userID', userModel.uid);
      var e = await SharedPreferencesHelper.getData('userEmail');
      var s = await SharedPreferencesHelper.getData('userName');
      var x = await SharedPreferencesHelper.getData('userID');
      print('-------------------> $e');
      print('-------------------> $s');
      print('-------------------> $x');
      print(userModel.email);


      return ApiResult.success(userModel);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}