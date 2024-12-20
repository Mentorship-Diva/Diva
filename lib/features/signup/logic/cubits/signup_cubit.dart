import 'package:flutter/cupertino.dart';
import 'package:mentorship/features/signup/data/models/signup_request_body.dart';
import 'package:mentorship/features/signup/data/repos/signup_repo.dart';
import 'package:mentorship/features/signup/data/repos/auth_with_google_repo.dart';
import 'package:mentorship/features/signup/logic/cubits/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repos/signup_with_mobile_repo.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo signupRepo;
  final AuthWithGoogleRepo authWithGoogleRepo;
  final SignupWithPhoneNumberRepo signupWithPhoneNumberRepo;

  SignupCubit(
    this.signupRepo,
    this.authWithGoogleRepo,
    this.signupWithPhoneNumberRepo,
  ) : super(const SignupState.initial());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> phoneFormKey = GlobalKey<FormState>();
  bool isEmailForm = true;


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
    var response = await authWithGoogleRepo.authWithGoogle();
    response.when(
      success: (userModel) {
        emit(SignupState.signupGoogleSuccess(userModel));
      },
      failure: (error) {
        emit(SignupState.signupGoogleFail(error: error.toString()));
      },
    );
  }

  void sendOtp({required String phoneNumber}) async {
    emit(const SignupState.sendOtpLoading());
    var response = await signupWithPhoneNumberRepo.sendOtp(phoneNumber);
    response.when(
      success: (data) {
        emit(SignupState.sendOtpSuccess(data));
      },
      failure: (error) {
        emit(SignupState.sendOtpFail(error: error.toString()));
      },
    );
  }

  void resendOtp({required String phoneNumber}) async {
    emit(const SignupState.resendOtpLoading());
    var response = await signupWithPhoneNumberRepo.sendOtp(phoneNumber);
    response.when(
      success: (data) {
        emit(SignupState.resendOtpSuccess(data));
      },
      failure: (error) {
        emit(SignupState.resendOtpFail(error: error.toString()));
      },
    );
  }

  void verifyPhoneNumber({required String otp}) async {
    emit(const SignupState.verifyPhoneNumberLoading());
    var response = await signupWithPhoneNumberRepo.verifyPhoneNumber(otp);

    response.when(
      success: (user){
        emit(SignupState.verifyPhoneNumberSuccess(user));
      },
        fail: (error){
          emit(SignupState.verifyPhoneNumberFail(error: error.code ?? ''));
        },
    );
  }
}
