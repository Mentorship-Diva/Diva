import 'package:flutter/cupertino.dart';
import 'package:mentorship/features/signup/data/models/signup_request_body.dart';
import 'package:mentorship/features/signup/data/repos/signup_repo.dart';
import 'package:mentorship/features/signup/data/repos/signup_with_google_repo.dart';
import 'package:mentorship/features/signup/logic/cubits/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo signupRepo;
  final SignupWithGoogleRepo signupWithGoogleRepo;

  SignupCubit(this.signupRepo, this.signupWithGoogleRepo)
      : super(const SignupState.initial());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void signup() async {
    emit(const SignupState.signupLoading());
    var response = await signupRepo.signUp(SignupRequestBody(
      emailController.text,
      passwordController.text,
    ));
    response.when(success: (userCredential) {
      emit(SignupState.signupSuccess(userCredential));
    }, fail: (error) {
      emit(SignupState.signupFail(error: error.message ?? ''));
    });
  }

  void signupWithGoogle() async {
    emit(const SignupState.signupGoogleLoading());
    var response = await signupWithGoogleRepo.signUpWithGoogle();
    response.when(
      success: (userModel) {
        emit(SignupState.signupGoogleSuccess(userModel));
      },
      failure: (error) {
        emit(SignupState.signupGoogleFail(error: error.toString()));
      },
    );
  }
}