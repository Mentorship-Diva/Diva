import 'package:flutter/material.dart';
import 'package:mentorship/core/theming/assets.dart';
import '../../../../core/theming/colors.dart';
import '../widgets/auth_title_and_image.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            AuthTitleAndImage(
              title: 'Sign Up',
              image: AppAssets.signupIll,
            ),
          ],
        ),
      )),
    );
  }
}