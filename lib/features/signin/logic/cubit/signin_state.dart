import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentorship/features/signup/data/models/user_model.dart';

part 'signin_state.freezed.dart';


@freezed
class SigninState<T> with _$SigninState {
  const factory SigninState.initial() = _Initial;

  const factory SigninState.signinLoading() = SigninLoading;

  const factory SigninState.signinSuccess(T data) = SigninSuccess<T>;

  const factory SigninState.signinFail({required String error}) = SigninFail;

  const factory SigninState.signinGoogleLoading() = SigninGoogleLoading;

  const factory SigninState.signinGoogleSuccess(UserModel userModel) =  SigninGoogleSuccess<T>;

  const factory SigninState.signinGoogleFail({required String error}) = SigninGoogleFail;

  const factory SigninState.remeberMe({required bool value}) = RememberMe;

}
