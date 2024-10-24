import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:mentorship/features/profile/data/models/user_model.dart';
import 'package:mentorship/features/profile/data/repos/edit_user_repo.dart';
import 'package:mentorship/features/profile/logic/profile_state.dart';
import '../../../../core/helpers/shared_prefrances_helper.dart';
import '../data/repos/logout_repo.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(
    this.logoutRepo,
    this.editUserRepo,
  ) : super(ProfileState.initial());

  final LogoutRepo logoutRepo;
  final EditUserRepo editUserRepo;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();

  Future logout() async {
    emit(ProfileState.logoutLoading());
    var response = await logoutRepo.logout();
    response.when(success: (data) {
      print('SUCCESS');
      emit(ProfileState.logoutSuccess(response));
    }, fail: (error) {
      print('FAIL');
      emit(ProfileState.logoutFail(error: error.message ?? ''));
    });
  }

  Future googleLogout() async {
    emit(ProfileState.logoutLoading());
    var response = await logoutRepo.googleLogout();
    response.when(success: (data) {
      print('SUCCESS');
      emit(ProfileState.logoutSuccess(response));
    }, fail: (error) {
      print('FAIL');
      emit(ProfileState.logoutFail(error: error.message ?? ''));
    });
  }

  String userEmail = '';
  String userName = '';
  bool isGoogleSignIn = false;

  Future setUserData({required String userName,}) async {
    emit(ProfileState.setUserDataLoading());
    var response = await editUserRepo.setUserData(userName);
    response.when(success: (data) {
      emit(ProfileState.setUserDataSuccess(data));
    }, fail: (error) {
      emit(ProfileState.setUserDataFail(error: error.message ?? ''));
    });
  }

  getCachedUserData() async {
    userEmail = await SharedPreferencesHelper.getData('userEmail') ?? '';
    userName = await SharedPreferencesHelper.getData('userName') ?? '';
    isGoogleSignIn = await SharedPreferencesHelper.getData('isGoogleSignIn') ?? false;



    print(userName);
    print(userEmail);


    emit(
      ProfileState.getUserData(
        UserDataModel(
          userEmail,
          userName,
        ),
      ),
    );
  }
}
