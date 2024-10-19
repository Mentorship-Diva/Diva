import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/di/dependency_injection.dart';
import 'package:mentorship/core/theming/assets.dart';
import 'package:mentorship/features/signup/logic/cubits/signup_cubit.dart';
import '../../../../core/theming/colors.dart';
import '../widgets/signup/already_have_an_account.dart';
import '../widgets/signup/auth_title_and_image.dart';
import '../widgets/signup/or_text_with_horizontal_divider.dart';
import '../widgets/signup/signup_button.dart';
import '../widgets/signup/signup_form.dart';
import '../widgets/signup/social_accounts.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignupCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        const AuthTitleAndImage(
                          title: 'Sign Up',
                          image: AppAssets.signupIll,
                        ),
                        const SignupForm(),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 24.h),
                          child: SignupButton(),
                        ),
                        const OrTextWithHorizontalDivider(),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 24.h),
                          child: const SocialAccounts(),
                        ),
                        const AlreadyHaveAnAccount(),
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
