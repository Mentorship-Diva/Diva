import 'package:flutter/material.dart';
import 'package:mentorship/core/helpers/extensions.dart';

import '../../../../../core/theming/text_styles.dart';
import '../../../../../generated/l10n.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).alreadyHaveAnAccount,
          style: AppTextStyles.font18Black400,
        ),
        GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Text(
            S.of(context).signIn,
            style: AppTextStyles.font18Pink400,
          ),
        ),
      ],
    );
  }
}
