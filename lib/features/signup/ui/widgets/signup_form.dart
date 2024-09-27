import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/helpers/text_form_field_validators.dart';
import 'package:mentorship/core/widgets/app_text_form_field.dart';
import 'package:mentorship/features/signup/ui/widgets/password_validations.dart';
import '../../../../core/helpers/app_regex.dart';
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
  bool hasMinimum8Characters = false;
  bool hasOneUpperCharacter = false;
  bool hasOneLowerCharacter = false;
  bool hasOneSpecialCharacter = false;


  @override
  void initState() {
    super.initState();
    setupPasswordValidationsListener();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: AppTextFormField(
              controller: emailController,
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
          PasswordValidations(
            hasMinimum8Characters: hasMinimum8Characters,
            hasOneUpperCharacter: hasOneUpperCharacter,
            hasOneLowerCharacter: hasOneLowerCharacter,
            hasOneSpecialCharacter: hasOneSpecialCharacter,
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.h),
            child: AppTextFormField(
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
          ),
        ],
      ),
    );
  }
  void setupPasswordValidationsListener() {
    passwordController.addListener(
          () {
        setState(() {
          hasMinimum8Characters =
              AppRegex.hasMinLength(passwordController.text);
          hasOneUpperCharacter = AppRegex.hasUpperCase(passwordController.text);
          hasOneLowerCharacter = AppRegex.hasLowerCase(passwordController.text);
          hasOneSpecialCharacter =
              AppRegex.hasSpecialCharacter(passwordController.text);
        });
      },
    );
  }
}
