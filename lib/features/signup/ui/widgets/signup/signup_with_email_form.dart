import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/di/dependency_injection.dart';
import 'package:mentorship/features/signup/ui/widgets/signup/password_validations.dart';
import '../../../../../core/helpers/app_regex.dart';
import '../../../../../core/helpers/text_form_field_validators.dart';
import '../../../../../core/helpers/text_selection_options.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../generated/l10n.dart';
import '../../../logic/cubits/signup_cubit.dart';

class SignupWithEmailForm extends StatefulWidget {
  const SignupWithEmailForm({super.key});

  @override
  State<SignupWithEmailForm> createState() => _SignupWithEmailFormState();
}

class _SignupWithEmailFormState extends State<SignupWithEmailForm> {
  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;
  bool hasMinimum8Characters = false;
  bool hasOneUpperCharacter = false;
  bool hasOneLowerCharacter = false;
  bool hasOneSpecialCharacter = false;
  bool isValidatorsVisible = false;

  @override
  void initState() {
    super.initState();
    getIt<SignupCubit>().passwordController.addListener(setupPasswordValidationsListener);
    setupPasswordValidationsListener();
  }

  @override
  void dispose() {
    getIt<SignupCubit>().passwordController.removeListener(setupPasswordValidationsListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().emailFormKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: AppTextFormField(
              controller: context.read<SignupCubit>().emailController,
              hintText: S.of(context).email,
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
            hintText: S.of(context).password,
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
            onChanged: (value) {
              setState(() {
                isValidatorsVisible = true;
              });
            },
            onEditingComplete: () {
              setState(() {
                isValidatorsVisible = false;
              });
            },
          ),
          Visibility(
            visible: isValidatorsVisible,
            child: PasswordValidations(
              hasMinimum8Characters: hasMinimum8Characters,
              hasOneUpperCharacter: hasOneUpperCharacter,
              hasOneLowerCharacter: hasOneLowerCharacter,
              hasOneSpecialCharacter: hasOneSpecialCharacter,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.h),
            child: AppTextFormField(
              controller: context.read<SignupCubit>().confirmPasswordController,
              hintText: S.of(context).confirmPassword,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              contextMenuBuilder:
              TextSelectionOptions.passwordTextSelectionOptions,
              validator: (value) {
                if (value!.isEmpty) {
                  return S.of(context).confirmPasswordIsRequired;
                } else if (context
                    .read<SignupCubit>()
                    .confirmPasswordController
                    .text !=
                    context.read<SignupCubit>().passwordController.text) {
                  return S.of(context).confirmPasswordIsNotValid;
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


  if(mounted)  setState(() {
      hasMinimum8Characters = AppRegex.hasMinLength(
          context.read<SignupCubit>().passwordController.text);
      hasOneUpperCharacter = AppRegex.hasUpperCase(
          context.read<SignupCubit>().passwordController.text);
      hasOneLowerCharacter = AppRegex.hasLowerCase(
          context.read<SignupCubit>().passwordController.text);
      hasOneSpecialCharacter = AppRegex.hasSpecialCharacter(
          context.read<SignupCubit>().passwordController.text);
    });

  }
}