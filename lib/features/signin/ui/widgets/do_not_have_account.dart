import 'package:flutter/material.dart';
import 'package:mentorship/core/helpers/extensions.dart';
import 'package:mentorship/core/routing/routes.dart';
import 'package:mentorship/core/theming/text_styles.dart';

class DoNotHaveAccount extends StatelessWidget {
  const DoNotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account? ',
          style: AppTextStyles.font18Black400,
        ),
        GestureDetector(
          onTap: () {
            context.pushNamed(Routes.signupScreen);
          },
          child: Text(
            'Sign up',
            style: AppTextStyles.font18Pink400,
          ),
        ),
      ],
    );
  }
}