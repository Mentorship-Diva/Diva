import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart';

@freezed
class SignupState<T> with _$SignupState<T> {
  const factory SignupState.initial() = _Initial;

  const factory SignupState.loading() = Loading;

  const factory SignupState.success() = Success;

  const factory SignupState.fail() = Fail;
}
