import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship/core/helpers/dialogs.dart';
import 'package:mentorship/core/helpers/extensions.dart';
import 'package:mentorship/core/routing/routes.dart';
import 'package:mentorship/core/widgets/app_main_button.dart';
import 'package:mentorship/core/widgets/loading_dialog.dart';
import 'package:mentorship/core/widgets/toast.dart';
import 'package:mentorship/features/signin/logic/signin_cubit.dart';
import 'package:mentorship/features/signin/logic/signin_state.dart';

import '../../../../generated/l10n.dart';

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
            context.pushNamed(Routes.mainScreen);
            Dialogs.showSuccessDialog(
                context, 'Successful Login. Welcome Back');
          },
          signinFail: (error) {
            context.pop();
            Dialogs.showFailureDialog(context, 'Could not signin. $error');
          },
        );
      },
      child: AppMainButton(
          onPressed: () {
            if (context.read<SigninCubit>().formKey.currentState!.validate()) {
              context.read<SigninCubit>().signin();
            }
          },
          title: 'Sign in'),
      child: AppMainButton(onPressed: () {
        if (context.read<SigninCubit>().formKey.currentState!.validate()) {
          context.read<SigninCubit>().signin();
        }
      }, title: S.of(context).signIn),
    );
  }
}
