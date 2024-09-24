import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/helpers/text_form_field_validators.dart';
import 'package:mentorship/core/widgets/app_text_form_field.dart';
import '../../../../core/helpers/text_selection_options.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final GlobalKey formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: emailController,
            hintText: 'E-mail',
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            contextMenuBuilder: TextSelectionOptions.emailTextSelectionOptions,
            validator: (value) =>
                TextFormFieldValidators.emailValidator(value, context),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: AppTextFormField(
              controller: passwordController,
              hintText: 'Password',
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              contextMenuBuilder:
                  TextSelectionOptions.passwordTextSelectionOptions,
              validator: (value) =>
                  TextFormFieldValidators.passwordValidator(value, context),
              isPassword: isPasswordHidden,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isPasswordHidden = !isPasswordHidden;
                  });
                },
                child: isPasswordHidden
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              ),
            ),
          ),
          AppTextFormField(
            controller: confirmPasswordController,
            hintText: 'Confirm Password',
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            contextMenuBuilder:
                TextSelectionOptions.passwordTextSelectionOptions,
            validator: (value) =>
                TextFormFieldValidators.passwordValidator(value, context),
            isPassword: isConfirmPasswordHidden,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isConfirmPasswordHidden = !isConfirmPasswordHidden;
                });
              },
              child: isConfirmPasswordHidden
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
            ),
          ),
        ],
      ),
    );
  }
}
