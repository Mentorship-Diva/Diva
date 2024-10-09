import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mentorship/features/signup/logic/cubits/signup_cubit.dart';
import 'package:mentorship/features/signup/logic/cubits/signup_state.dart';
import '../../../../../core/theming/assets.dart';
import '../../../../../core/widgets/toast.dart';

class SocialAccounts extends StatelessWidget {
  const SocialAccounts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (current, previous) =>
          current is SignupGoggleLoading ||
          current is SignupGoggleSuccess ||
          current is SignupGoggleFail,
      listener: (context, state) {
        state.whenOrNull(
          signupGoogleSuccess: (userModel) {
            showToast(message: 'Welcome ${userModel.displayName}');
            // TODO: Navigate to Home screen
          },
          signupGoogleFail: (error) {
            showToast(message: error);
          },
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () async {
              context.read<SignupCubit>().signupWithGoogle();
            },
            child: SvgPicture.asset(AppAssets.google),
          ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 24.w),
          //   child: GestureDetector(
          //     onTap: () {},
          //     child: SvgPicture.asset(AppAssets.facebook),
          //   ),
          // ),
          // GestureDetector(
          //   onTap: () {},
          //   child: SvgPicture.asset(AppAssets.apple),
          // ),
        ],
      ),
    );
  }
}
