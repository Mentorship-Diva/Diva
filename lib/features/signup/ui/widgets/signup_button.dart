import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship/core/helpers/extensions.dart';
import 'package:mentorship/core/widgets/loading_dialog.dart';
import 'package:mentorship/core/widgets/toast.dart';
import 'package:mentorship/features/signup/logic/cubits/signup_cubit.dart';
import 'package:mentorship/features/signup/logic/cubits/signup_state.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/app_main_button.dart';

class SignupButton extends StatefulWidget {
  SignupButton({super.key});

  @override
  State<SignupButton> createState() => _SignupButtonState();
}

class _SignupButtonState extends State<SignupButton> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) =>
          current is SignupLoading ||
          current is SignupSuccess ||
          current is SignupFail ||
          current is SendOtpLoading ||
          current is SendOtpSuccess ||
          current is SendOtpFail,
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
            sendOtpLoading: () {
              print('LOADING!!!');
              loadingDialog(context);
            },
            sendOtpSuccess: (data) {
              context.pop();
              context.pushNamed(Routes.verificationScreen);
              print('SUCCESS');
            },
            sendOtpFail: (error) {
              context.pop();
              showToast(message: error);
            });
      },
      child: AppMainButton(
        onPressed: () {
          if (context.read<SignupCubit>().isEmailForm) {
            print('email');
            if (context
                .read<SignupCubit>()
                .emailFormKey
                .currentState!
                .validate()) {
              context.read<SignupCubit>().signup();
            }
          } else {
            print('phone');
            if (context
                .read<SignupCubit>()
                .phoneFormKey
                .currentState!
                .validate()) {
              print('VALID');
              context.read<SignupCubit>().sendOtp(
                    phoneNumber:
                        '+2${context.read<SignupCubit>().phoneNumberController.text}',
                  );
            }
          }
        },
        title: 'Sign Up',
      ),
    );
  }
}
