import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/helpers/text_form_field_validators.dart';
import 'package:mentorship/core/helpers/text_selection_options.dart';
import 'package:mentorship/core/theming/colors.dart';
import 'package:mentorship/core/theming/text_styles.dart';
import 'package:mentorship/core/widgets/app_text_form_field.dart';

class SigninWithEmailForm extends StatefulWidget {
  const SigninWithEmailForm({super.key});

  @override
  State<SigninWithEmailForm> createState() => _SigninWithEmailFormState();
}

class _SigninWithEmailFormState extends State<SigninWithEmailForm> {
  bool isPasswordHidden = true;
  bool remeberMe = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: AppTextFormField(
            hintText: 'E-mail',
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            contextMenuBuilder: TextSelectionOptions.emailTextSelectionOptions,
            validator: (value) =>
                TextFormFieldValidators.emailValidator(value, context),
          ),
        ),
        AppTextFormField(
          hintText: 'Password',
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.next,
          contextMenuBuilder: TextSelectionOptions.passwordTextSelectionOptions,
          validator: (value) =>
              TextFormFieldValidators.passwordValidator(value, context),
          isPassword: isPasswordHidden,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                isPasswordHidden = !isPasswordHidden;
              });
            },
            child: Icon(
              isPasswordHidden ? Icons.visibility_off : Icons.visibility,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Align(
            alignment: Alignment.centerRight,
            child: Text("Forgot password?",
                style: AppTextStyles.font14PinkRegular),
          ),
        ),
        Row(
          children: [
            Checkbox(
              activeColor: AppColors.mainPinkColor,
              value: remeberMe,
              onChanged: (value) {
                setState(() {
                  remeberMe = value!;
                });
              },
            ),
            Text(
              "Remember me",
              style: AppTextStyles.font14Black400,
            ),
          ],
        )
      ],
    );
  }
}
