import 'package:flutter/material.dart';

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
          style: AppTextStyles.font18Black400,
        ),
        GestureDetector(
          onTap: () {
            // TODO: Add navigator to Signin screen.
          },
          child: Text(
            'Sign In',
            style: AppTextStyles.font18Pink400,
          ),
        ),
      ],
    );
  }
}
