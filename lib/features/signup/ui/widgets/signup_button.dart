import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship/core/helpers/extensions.dart';
import 'package:mentorship/core/widgets/loading_dialog.dart';
import 'package:mentorship/features/signup/logic/cubits/signup_cubit.dart';
import 'package:mentorship/features/signup/logic/cubits/signup_state.dart';
import '../../../../core/widgets/app_main_button.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state == const SignupState.loading()) {
          loadingDialog(context);
        } else if (state == const SignupState.success()) {
          context.pop();
        } else if (state == const SignupState.fail()) {
          context.pop();
        }
      },
      child: AppMainButton(
        onPressed: () {
          if (context.read<SignupCubit>().formKey.currentState!.validate()) {
            context.read<SignupCubit>().signup();
          }
        },
        title: 'Sign Up',
      ),
    );
  }
}
