import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/features/signup/logic/cubits/signup_cubit.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/theming/colors.dart';
import 'package:mentorship/core/theming/assets.dart';
import '../widgets/signup/auth_title_and_image.dart';
import '../widgets/verification/code_will_be_sent_to_number.dart';
import '../widgets/verification/pin_code_form.dart';
import '../widgets/verification/resend_code.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<SignupCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        const AuthTitleAndImage(
                          title: 'Verification Code',
                          image: AppAssets.verificationIll,
                        ),
                        const CodeWillBeSentToNumber(),
                        SizedBox(
                          height: 8.h,
                        ),
                         PicCodeForm(),
                        const ResendCode(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
