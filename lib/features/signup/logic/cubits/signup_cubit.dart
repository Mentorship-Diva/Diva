import 'package:mentorship/features/signup/data/models/signup_request_body.dart';
import 'package:mentorship/features/signup/data/repos/signup_repo.dart';
import 'package:mentorship/features/signup/logic/cubits/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo signupRepo;

  SignupCubit(this.signupRepo) : super(const SignupState.initial());

  void signup({
    required String email,
    required String password,
  }) async {
    emit(const SignupState.loading());
    signupRepo.signUp(SignupRequestBody(email, password)).then((value) {
      emit(const SignupState.success());
    }).catchError((onError) {
      emit(const SignupState.fail());
    });
  }
}
