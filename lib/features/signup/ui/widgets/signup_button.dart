import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship/core/routing/app_router.dart';
import 'package:mentorship/features/signup/data/models/signup_request_body.dart';
import 'package:mentorship/features/signup/logic/cubits/signup_cubit.dart';
import '../../../../core/widgets/app_main_button.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  // final FirebaseAuth auth = FirebaseAuth.instance;
  // SignupRequestBody signupRequestBody = SignupRequestBody('', '');
  //
  //   Future<void> signUp() async {
  //     signupRequestBody.email = emailController.text;
  //     signupRequestBody.password = passwordController.text;
  //     try {
  //       UserCredential userCredential = await auth.createUserWithEmailAndPassword(
  //         email: signupRequestBody.email,
  //         password: signupRequestBody.password,
  //       );
  //       debugPrint('User signed up: ${userCredential.user?.email}');
  //     } catch (error) {
  //       debugPrint('Sign up failed: $error');
  //     }
  //   }

  @override
  Widget build(BuildContext context) {
    return AppMainButton(
      onPressed: () {
        context.read<SignupCubit>().signup(
              email: emailController.text,
              password: passwordController.text,
            );
      },
      title: 'Sign Up',
    );
  }
}
