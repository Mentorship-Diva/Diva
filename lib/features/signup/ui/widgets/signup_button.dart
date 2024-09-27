import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship/core/helpers/extensions.dart';
import 'package:mentorship/core/widgets/loading_dialog.dart';
import 'package:mentorship/core/widgets/toast.dart';
import 'package:mentorship/features/signup/logic/cubits/signup_cubit.dart';
import 'package:mentorship/features/signup/logic/cubits/signup_state.dart';
import '../../../../core/widgets/app_main_button.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) =>
          current is SignupLoading ||
          current is SignupSuccess ||
          current is SignupFail,
      listener: (context, state) {
        state.whenOrNull(
          signupLoading: () {
            loadingDialog(context);
          },
          signupSuccess: (userCredential) {
            context.pop();
            debugPrint(userCredential.toString());
            showToast(message: 'Signup successfully');
            // TODO: Navigate to Signin screen
          },
          signupFail: (error) {
            context.pop();
            debugPrint(error);
            showToast(message: error);
          },
        );
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
