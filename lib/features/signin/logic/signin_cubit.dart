import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship/core/helpers/shared_prefrances_helper.dart';
import 'package:mentorship/features/signin/data/models/signin_request_body.dart';
import 'package:mentorship/features/signin/data/repo/signin_repo.dart';
import 'package:mentorship/features/signin/logic/signin_state.dart';
import 'package:mentorship/features/signup/data/repos/auth_with_google_repo.dart';

class SigninCubit extends Cubit<SigninState> {
  final SignInRepo signInRepo;
  final AuthWithGoogleRepo authWithGoogleRepo;
  SigninCubit(this.signInRepo, this.authWithGoogleRepo)
      : super(SigninState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool rememberMe = false;

  void signin() async {
    emit(const SigninState.signinLoading());
    var responce = await signInRepo.signIn(SigninRequestBody(
      email: emailController.text,
      password: passwordController.text,
    ));

    responce.when(
      success: (userCredential) {
        emit(SigninState.signinSuccess(userCredential));
      },
      fail: (error) {
        emit(SigninState.signinFail(error: error.message ?? ''));
      },
    );
  }

  void signinWithGoogle() async {
    emit(const SigninState.signinGoogleLoading());
    var response = await authWithGoogleRepo.authWithGoogle();
    response.when(
      success: (userModel) {
        emit(SigninState.signinGoogleSuccess(userModel));
      },
      failure: (error) {
        emit(SigninState.signinGoogleFail(error: error.toString()));
      },
    );
  }

  void setRememberMe(bool value) {
    rememberMe = value;
    emit(SigninState.remeberMe(value: value));

    if (value) {
      SharedPreferencesHelper.setData("email", emailController.text);
      SharedPreferencesHelper.setData("password", passwordController.text);
      debugPrint(
          ' email is : ${emailController.text} password is: ${passwordController.text}');
    } else {
      SharedPreferencesHelper.removeData("email");
      SharedPreferencesHelper.removeData("password");
    }
  }

  autoLogin() async {

      final email = await SharedPreferencesHelper.getData("email");
      final password = await SharedPreferencesHelper.getData("password");
      emailController.value = TextEditingValue(text: email ?? '');
      passwordController.value = TextEditingValue(text: password ?? '');
      debugPrint(
          ' email is : ${emailController.value} password is: ${passwordController.value}');
    }
  }