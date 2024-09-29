import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship/core/helpers/extensions.dart';
import 'package:mentorship/core/widgets/loading_dialog.dart';
import 'package:mentorship/core/widgets/toast.dart';
import 'package:mentorship/features/signup/logic/cubits/signup_cubit.dart';
import 'package:mentorship/features/signup/logic/cubits/signup_state.dart';
import '../../../../core/widgets/app_main_button.dart';

class SignupButton extends StatefulWidget {
   SignupButton({super.key});

  @override
  State<SignupButton> createState() => _SignupButtonState();
}

class _SignupButtonState extends State<SignupButton> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) =>
          current is SignupLoading ||
          current is SignupSuccess ||
          current is SignupFail,
      listener: (context, state) {
        state.whenOrNull(
          signupLoading: () {
            loadingDialog(context);
          },
          signupSuccess: (userCredential) {
            context.pop();
            debugPrint(userCredential.toString());
            showToast(message: 'Signup successfully');
            // TODO: Navigate to Signin screen
          },
          signupFail: (error) {
            context.pop();
            debugPrint(error);
            showToast(message: error);
          },
        );
      },
      child: Column(
        children: [
          AppMainButton(
            onPressed: () {
              if(context.read<SignupCubit>().isEmailForm){
                print('email');
                if (context.read<SignupCubit>().emailFormKey.currentState!.validate()) {
                  context.read<SignupCubit>().signup();
                }
              } else {
                print('phone');
                if (context.read<SignupCubit>().phoneFormKey.currentState!.validate()) {
                  print('VALID');
                }
              }
              },
            title: 'Sign Up',
          ),
        ],
      ),
    );
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  String? verificationId;

  void sendOtp(String phoneNumber) async {
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
        print('credential');
        print(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle error
        print("Verification failed: ${e.message}");
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text("Verification failed: ${e.message}")),
        // );
      },
      codeSent: (String verificationId, int? resendToken) {
        print('verificationId');
        print(verificationId);
        // Store the verification ID for use when the OTP is entered
        setState(() {
        this.verificationId = verificationId;
        });
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text("OTP has been sent")),
        // );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print('TIME OUT');
        // Auto-retrieval timeout
        setState(() {
        this.verificationId = verificationId;
        });
      },
    );
  }

  void signInWithOtp(String otp) async {
    // if (verificationId != null) {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        smsCode: otp
      );

      try {
        // Attempt to sign in
        await auth.signInWithCredential(credential);
        print('credential');
        print(credential);
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text("Sign-in successful!")),
        // );
      } catch (e) {
        print("Error during OTP sign-in: $e");
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text("Error during sign-in: $e")),
        // );
      // }
    }
  }
}
