import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/theming/assets.dart';
import '../../../../core/theming/colors.dart';
import '../widgets/already_have_an_account.dart';
import '../widgets/auth_title_and_image.dart';
import '../widgets/or.dart';
import '../widgets/social_accounts.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              const AuthTitleAndImage(
                title: 'Sign Up',
                image: AppAssets.signupIll,
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
      )),
    );
  }
}