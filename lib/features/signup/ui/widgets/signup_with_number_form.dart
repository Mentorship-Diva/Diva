import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship/core/helpers/text_form_field_validators.dart';
import 'package:mentorship/features/signup/logic/cubits/signup_cubit.dart';

import '../../../../core/helpers/text_selection_options.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class SignupWithNumberForm extends StatelessWidget {
  const SignupWithNumberForm({super.key});

  @override
  Widget build(BuildContext context) {
    return  Form(
      key: context.read<SignupCubit>().phoneFormKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<SignupCubit>().phoneNumberController,
            hintText: 'Mobile Number',
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.phone,
            contextMenuBuilder:
            TextSelectionOptions.emailTextSelectionOptions, //  Same as email selections
            validator: (value) => TextFormFieldValidators.phoneNumberValidator(value, context),
          ),
        ],
      ),
    );
  }
}
