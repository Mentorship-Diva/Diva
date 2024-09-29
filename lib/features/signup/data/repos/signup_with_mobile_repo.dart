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
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle error
        print("Verification failed: ${e.message}");
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text("Verification failed: ${e.message}")),
        // );
      },
      codeSent: (String verificationId, int? resendToken) {
        // Store the verification ID for use when the OTP is entered
        // setState(() {
          this.verificationId = verificationId;
        // });
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text("OTP has been sent")),
        // );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-retrieval timeout
        // setState(() {
          this.verificationId = verificationId;
        // });
      },
    );
    return ApiResult.success('');
  }


  Future<ApiResult> verifyPhonenumber(String otp) async {
    if (verificationId != null) {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        smsCode: otp,
      );

      try {
        // Attempt to sign in
        await auth.signInWithCredential(credential);
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text("Sign-in successful!")),
        // );
      } catch (e) {
        print("Error during OTP sign-in: $e");
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text("Error during sign-in: $e")),
        // );
      }
    }
    return ApiResult.success('');
  }

}