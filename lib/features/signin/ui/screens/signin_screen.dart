import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/theming/assets.dart';
import 'package:mentorship/core/theming/colors.dart';
import 'package:mentorship/features/signin/ui/widgets/do_not_have_account.dart';
import 'package:mentorship/features/signin/ui/widgets/google_account.dart';
import 'package:mentorship/features/signin/ui/widgets/signin_button.dart';
import 'package:mentorship/features/signin/ui/widgets/signin_with_email_form.dart';
import 'package:mentorship/features/signup/ui/widgets/auth_title_and_image.dart';
import 'package:mentorship/features/signup/ui/widgets/or_text_with_horizontal_divider.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

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
                Expanded(
                  child: ListView(
                    children: [
                      const AuthTitleAndImage(
                        title: 'Welcome Back',
                        image: AppAssets.signinIll,
                      ),
                      const SigninWithEmailForm(),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: const SigninButton(),
                      ),
                      const OrTextWithHorizontalDivider(),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        child: const GoogleAccount(),
                      ),
                      const DoNotHaveAccount(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
