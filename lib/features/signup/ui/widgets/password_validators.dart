import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/Resource/Strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'flutter_pw_validator.dart';

class PasswordValidators extends StatelessWidget {
  const PasswordValidators({
    super.key,
    required this.passwordController,
    required this.isValidationsVisible,
  });

  final TextEditingController passwordController;
  final bool isValidationsVisible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isValidationsVisible,
      child: Padding(
        padding: EdgeInsets.only(
          left: 8.h,
          right: 8.h,
          top: 8.h,
        ),
        child: FlutterPwValidator(
          width: 400,
          height: 85,
          minLength: 8,
          uppercaseCharCount: 1,
          lowercaseCharCount: 1,
          specialCharCount: 1,
          onSuccess: () {},
          controller: passwordController,
          strings: CustomPasswordValidatorString(),
        ),
      ),
    );
  }
}

class CustomPasswordValidatorString implements FlutterPwValidatorStrings {
  @override
  final String atLeast = '8 Characters Minimum';
  @override
  final String uppercaseLetters = 'One Upper Character';
  @override
  final String lowercaseLetters = 'One Lower Character';
  @override
  final String numericCharacters = 'One numeric Character';
  @override
  final String specialCharacters = 'One Special Character';

  @override
  String get normalLetters {
    return '';
  }
}
