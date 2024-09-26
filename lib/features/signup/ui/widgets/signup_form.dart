import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/helpers/text_form_field_validators.dart';
import 'package:mentorship/core/widgets/app_text_form_field.dart';
import 'package:mentorship/features/signup/ui/widgets/password_validators.dart';
import '../../../../core/helpers/text_selection_options.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final GlobalKey formKey = GlobalKey<FormState>();

  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;
  bool isValidationsVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: AppTextFormField(
              controller: widget.emailController,
              hintText: 'E-mail',
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              contextMenuBuilder:
                  TextSelectionOptions.emailTextSelectionOptions,
              validator: (value) =>
                  TextFormFieldValidators.emailValidator(value, context),
            ),
          ),
          AppTextFormField(
            controller: widget.passwordController,
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
            onTap: () {
              setState(() {
                isValidationsVisible = true;
              });
            },
          ),
          PasswordValidators(
            passwordController: widget.passwordController,
            isValidationsVisible: isValidationsVisible,
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.h),
            child: AppTextFormField(
              controller: widget.confirmPasswordController,
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
          ),
        ],
      ),
    );
  }
}
