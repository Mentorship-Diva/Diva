import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theming/text_styles.dart';
import '../../../logic/cubits/signup_cubit.dart';

class CodeWillBeSentToNumber extends StatelessWidget {
  const CodeWillBeSentToNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'The code will be sent to ',
        ),
        Text(
          '+2${context.read<SignupCubit>().phoneNumberController.text}',
          style: AppTextStyles.font14Pink400(context),
        )
      ],
    );
  }
}
