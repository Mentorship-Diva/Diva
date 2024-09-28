import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/helpers/text_form_field_validators.dart';
import 'package:mentorship/core/widgets/app_text_form_field.dart';
import 'package:mentorship/features/signup/ui/widgets/password_validations.dart';
import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/text_selection_options.dart';
import '../../logic/cubits/signup_cubit.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({
    super.key,
  });

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {

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
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: AppTextFormField(
              controller: context.read<SignupCubit>().emailController,
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
            controller: context.read<SignupCubit>().passwordController,
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
              controller: context.read<SignupCubit>().confirmPasswordController,
              hintText: 'Confirm Password',
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              contextMenuBuilder:
                  TextSelectionOptions.passwordTextSelectionOptions,
              validator: (value) {
                if(value!.isEmpty) {
                  return 'Confirm Password is required';
                } else if (context.read<SignupCubit>().confirmPasswordController.text != context.read<SignupCubit>().passwordController.text) {
                  return 'Password does\'t match';
                }
                return null;
              },
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
    context.read<SignupCubit>().passwordController.addListener(
          () {
        setState(() {
          hasMinimum8Characters =
              AppRegex.hasMinLength(context.read<SignupCubit>().passwordController.text);
          hasOneUpperCharacter = AppRegex.hasUpperCase(context.read<SignupCubit>().passwordController.text);
          hasOneLowerCharacter = AppRegex.hasLowerCase(context.read<SignupCubit>().passwordController.text);
          hasOneSpecialCharacter =
              AppRegex.hasSpecialCharacter(context.read<SignupCubit>().passwordController.text);
        });
      },
    );
  }

}
