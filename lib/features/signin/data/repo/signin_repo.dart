import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mentorship/core/networking/firebase/firebase_error_model.dart';
import 'package:mentorship/core/networking/firebase/firebase_result.dart';
import 'package:mentorship/features/signin/data/models/signin_request_body.dart';

class SignInRepo {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<FirebaseResult> signIn(SigninRequestBody signinRequestBody) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: signinRequestBody.email,
        password: signinRequestBody.password,
      );
      debugPrint('User signed in: ${userCredential.user?.email}');
      return FirebaseResult.success(userCredential);
    } on FirebaseAuthException catch (error) {
      debugPrint(
          'Sign in failed with code: ${error.code}, message: ${error.message}');
      return FirebaseResult.fail(
        FirebaseErrorModel(
          message: error.message!,
          code: error.code,
        ),
      );
    }
  }
}