import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentorship/core/theming/assets.dart';
import 'package:mentorship/core/widgets/toast.dart';
import 'package:mentorship/features/signin/logic/cubit/signin_cubit.dart';
import 'package:mentorship/features/signin/logic/cubit/signin_state.dart';

class GoogleAccount extends StatelessWidget {
  const GoogleAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SigninCubit, SigninState>(
      listenWhen: (previous, current) =>
          current is SigninGoogleSuccess ||
          current is SigninGoogleFail ||
          current is SigninGoogleLoading,
      listener: (context, state) {
        state.whenOrNull(
          signinGoogleSuccess: (UserModel) {
            showToast(message: 'Welcome ${UserModel.displayName}');
          },
          signinGoogleFail: (error) {
            debugPrint(error);
            showToast(message: error);
          },
        );
      },
      child: GestureDetector(
          onTap: () {
            context.read<SigninCubit>().signinWithGoogle();
          },
          child: SvgPicture.asset(AppAssets.google)),
    );
  }
}
