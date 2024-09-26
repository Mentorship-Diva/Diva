import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../models/signup_request_body.dart';

class SignupRepo {
  final FirebaseAuth auth = FirebaseAuth.instance;

  SignupRepo(Object object);
  Future<void> signUp(SignupRequestBody signupRequestBody) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: signupRequestBody.email,
        password: signupRequestBody.password,
      );
      debugPrint('User signed up: ${userCredential.user?.email}');
    } catch (error) {
      debugPrint('Sign up failed: $error');
    }
  }
}
