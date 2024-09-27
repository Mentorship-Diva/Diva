import 'package:flutter/cupertino.dart';
import 'package:mentorship/features/signup/data/models/signup_request_body.dart';
import 'package:mentorship/features/signup/data/repos/signup_repo.dart';
import 'package:mentorship/features/signup/logic/cubits/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo signupRepo;

  SignupCubit(this.signupRepo) : super(const SignupState.initial());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void signup() async {
    emit(const SignupState.loading());
    var response = await signupRepo.signUp(SignupRequestBody(
      emailController.text,
      passwordController.text,
    ));
    response.when(success: (userCredential) {
      emit(SignupState.success(userCredential));
    }, fail: (error) {
      emit(SignupState.fail(error: error.message ?? ''));
    });
  }
}
