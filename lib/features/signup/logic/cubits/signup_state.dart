import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentorship/features/signup/data/models/user_model.dart';

part 'signup_state.freezed.dart';

@freezed
class SignupState<T> with _$SignupState<T> {
  const factory SignupState.initial() = _Initial;

  const factory SignupState.signupLoading() = SignupLoading;

  const factory SignupState.signupSuccess(T data) = SignupSuccess<T>;

  const factory SignupState.signupFail({required String error}) = SignupFail;

  const factory SignupState.signupGoogleLoading() = SignupGoggleLoading;

  const factory SignupState.signupGoogleSuccess(UserModel userModel) =
      SignupGoggleSuccess<T>;

  const factory SignupState.signupGoogleFail({required String error}) =
      SignupGoggleFail;

  const factory SignupState.sendOtpLoading() = SendOtpLoading;

  const factory SignupState.sendOtpSuccess(T data) = SendOtpSuccess<T>;

  const factory SignupState.sendOtpFail({required String error}) = SendOtpFail;

  const factory SignupState.verifyPhoneNumberLoading() =
      VerifyPhoneNumberLoading;

  const factory SignupState.verifyPhoneNumberSuccess(User user) =
      VerifyPhoneNumberSuccess;

  const factory SignupState.verifyPhoneNumberFail({required String error}) =
      VerifyPhoneNumberFail;
}
