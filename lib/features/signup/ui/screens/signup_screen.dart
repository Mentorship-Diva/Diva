import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/di/dependency_injection.dart';
import 'package:mentorship/core/theming/assets.dart';
import 'package:mentorship/features/signup/data/repos/signup_repo.dart';
import 'package:mentorship/features/signup/logic/cubits/signup_cubit.dart';
import 'package:mentorship/features/signup/ui/widgets/signup_form.dart';
import '../../../../core/theming/colors.dart';
import '../widgets/already_have_an_account.dart';
import '../widgets/auth_title_and_image.dart';
import '../widgets/or.dart';
import '../widgets/signup_button.dart';
import '../widgets/social_accounts.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();


  @override
  Widget build(BuildContext context) {
    SignupRepo signupRepo = SignupRepo(getIt);
    return BlocProvider(
      create: (context) => SignupCubit(signupRepo),
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
                            title: 'Sign Up',
                            image: AppAssets.signupIll,
                          ),
                          SignupForm(
                            emailController: emailController,
                            passwordController: passwordController,
                            confirmPasswordController: confirmPasswordController,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 24.h),
                            child: SignupButton(
                              emailController: emailController,
                              passwordController: passwordController,
                              confirmPasswordController: confirmPasswordController,
                            ),
                          ),
                          const Or(),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 24.h),
                            child: SocialAccounts(
                              onGoogleTapped: () {},
                              onFacebookTapped: () {},
                              onAppleTapped: () {},
                            ),
                          ),
                          const AlreadyHaveAnAccount(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}