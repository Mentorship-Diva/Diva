import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mentorship/features/profile/data/models/user_model.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState<T> with _$ProfileState<T> {
  const factory ProfileState.initial() = _Initial;

  const factory ProfileState.logoutLoading() = LogoutLoading;

  const factory ProfileState.logoutSuccess(T data) = LogoutSuccess<T>;

  const factory ProfileState.logoutFail({required String error}) = LogoutFail;

  const factory ProfileState.setUserDataLoading() = SetUserDataLoading;

  const factory ProfileState.setUserDataSuccess(T data) = SetUserDataSuccess<T>;

  const factory ProfileState.setUserDataFail({required String error}) = SetUserDataFail;

  const factory ProfileState.getUserData(UserDataModel user) = GetUserData<T>;
}
