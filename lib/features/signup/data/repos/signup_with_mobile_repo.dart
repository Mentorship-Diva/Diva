import 'package:firebase_auth/firebase_auth.dart';
import 'package:mentorship/core/networking/api_result.dart';


class SignupWithPhoneNumberRepo {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String? verificationId;

  Future<ApiResult> sendOtp(String phoneNumber) async {
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
        print('credential');
        print(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print("Verification failed: ${e.message}");
      },
      codeSent: (String verificationId, int? resendToken) {
        print('verificationId');
        print(verificationId);
        this.verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print('TIME OUT');
        this.verificationId = verificationId;
      },
    );
    return ApiResult.success('');
  }

  // Future<ApiResult> verifyPhoneNumber(String otp) async {
  //   if (verificationId != null) {
  //     PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //         verificationId: verificationId!, smsCode: otp);
  //     try {
  //
  //
  //       print(auth.currentUser);
  //       // User? result =  await auth.currentUser; //signInWithCredential(authCredential);
  //
  //
  //
  //       // await auth.signInWithCredential(credential);
  //       // return ApiResult.success(credential);
  //     } catch (e) {
  //       print("Error during OTP sign-in: $e");
  //       return ApiResult.failure(e.toString());
  //     }
  //   }
  //   return ApiResult.failure('Verification ID is null');
  // }

  Future<ApiResult<User?>> verifyPhoneNumber(String otp) async {
    if (verificationId != null) {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId!, smsCode: otp);
      try {
        // Use signInWithCredential to sign in the user
        UserCredential userCredential = await auth.signInWithCredential(credential);
        print('User signed in: ${userCredential.user?.uid}');
        print('User signed in: ${userCredential.user?.uid}');
        return ApiResult.success(userCredential.user);
      } catch (e) {
        print("Error during OTP sign-in: $e");
        return ApiResult.failure(e.toString());
      }
    }
    return ApiResult.failure('Verification ID is null');
  }



}
