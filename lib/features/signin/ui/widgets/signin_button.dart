import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship/core/helpers/extensions.dart';
import 'package:mentorship/core/routing/routes.dart';
import 'package:mentorship/core/widgets/app_main_button.dart';
import 'package:mentorship/core/widgets/loading_dialog.dart';
import 'package:mentorship/core/widgets/toast.dart';
import 'package:mentorship/features/signin/logic/cubit/signin_cubit.dart';
import 'package:mentorship/features/signin/logic/cubit/signin_state.dart';

class SigninButton extends StatelessWidget {
  
  const SigninButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SigninCubit, SigninState>(
      listenWhen: (previous, current) =>
          current is SigninSuccess ||
          current is SigninFail ||
          current is SigninLoading,
      listener: (context, state) {
        state.whenOrNull(
          signinLoading: () {
            loadingDialog(context);
          },
          signinSuccess: (userCredential) {
            showToast(message: 'Signin successfully');
            context.pushNamed(Routes.mainScreen);
          },
          signinFail: (error) {
            context.pop();
            showToast(message: error);
          },
        );
      },
      child: AppMainButton(onPressed: () {
        if (context.read<SigninCubit>().formKey.currentState!.validate()) {
          context.read<SigninCubit>().signin();
        }
      }, title: 'Sign in'),
    );
  }
}
