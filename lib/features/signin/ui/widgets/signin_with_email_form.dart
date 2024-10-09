import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/helpers/app_regex.dart';
import 'package:mentorship/core/helpers/text_form_field_validators.dart';
import 'package:mentorship/core/helpers/text_selection_options.dart';
import 'package:mentorship/core/theming/colors.dart';
import 'package:mentorship/core/theming/text_styles.dart';
import 'package:mentorship/core/widgets/app_text_form_field.dart';
import 'package:mentorship/features/signin/logic/cubit/signin_cubit.dart';
import 'package:mentorship/features/signin/logic/cubit/signin_state.dart';
import 'package:mentorship/features/signup/ui/widgets/password_validations.dart';

class SigninWithEmailForm extends StatefulWidget {
  const SigninWithEmailForm({super.key});

  @override
  State<SigninWithEmailForm> createState() => _SigninWithEmailFormState();
}

class _SigninWithEmailFormState extends State<SigninWithEmailForm> {
  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;
  bool hasMinimum8Characters = false;
  bool hasOneUpperCharacter = false;
  bool hasOneLowerCharacter = false;
  bool hasOneSpecialCharacter = false;
  bool isValidatorsVisible = false;

  @override
  void initState() {
    setupPasswordValidationsListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SigninCubit>().formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: AppTextFormField(
              controller: context.read<SigninCubit>().emailController,
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
            controller: context.read<SigninCubit>().passwordController,
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
              child: Icon(
                isPasswordHidden ? Icons.visibility_off : Icons.visibility,
              ),
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
              BlocBuilder<SigninCubit, SigninState>(
                builder: (context, state) {
                  state.whenOrNull(
                    remeberMe: (value) {
                      value != context.read<SigninCubit>().rememberMe;
                    },
                  );
                  return Checkbox(
                    activeColor: AppColors.mainPinkColor,
                    value: context.read<SigninCubit>().rememberMe,
                    onChanged: (value) {
                      context.read<SigninCubit>().setRememberMe(value!); 
                    },
                  );
                },
              ),
              Text(
                "Remember me",
                style: AppTextStyles.font14Black400,
              ),
            ],
          )
        ],
      ),
    );
  }

  void setupPasswordValidationsListener() {
    context.read<SigninCubit>().passwordController.addListener(
      () {
        setState(() {
          hasMinimum8Characters = AppRegex.hasMinLength(
              context.read<SigninCubit>().passwordController.text);
          hasOneUpperCharacter = AppRegex.hasUpperCase(
              context.read<SigninCubit>().passwordController.text);
          hasOneLowerCharacter = AppRegex.hasLowerCase(
              context.read<SigninCubit>().passwordController.text);
          hasOneSpecialCharacter = AppRegex.hasSpecialCharacter(
              context.read<SigninCubit>().passwordController.text);
        });
      },
    );
  }
}
