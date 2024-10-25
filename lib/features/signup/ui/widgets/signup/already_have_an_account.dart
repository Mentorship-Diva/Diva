import 'package:flutter/material.dart';
import 'package:mentorship/core/helpers/extensions.dart';

import '../../../../../core/theming/text_styles.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: AppTextStyles.font18Black400(context),
        ),
        GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Text(
            'Sign In',
            style: AppTextStyles.font18Pink400(context),
          ),
        ),
      ],
    );
  }
}
