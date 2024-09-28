import 'package:flutter/material.dart';

import '../../../../core/widgets/app_text_form_field.dart';

class SignupWithNumberForm extends StatelessWidget {
  const SignupWithNumberForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Form(
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Mobile Number',
          ),
        ],
      ),
    );
  }
}
