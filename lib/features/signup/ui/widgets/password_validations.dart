import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/features/signup/ui/widgets/password_validator_item.dart';

class PasswordValidations extends StatelessWidget {
  const PasswordValidations({
    super.key,
    required this.hasMinimum8Characters,
    required this.hasOneUpperCharacter,
    required this.hasOneLowerCharacter,
    required this.hasOneSpecialCharacter,
  });

  final bool hasMinimum8Characters;
  final bool hasOneUpperCharacter;
  final bool hasOneLowerCharacter;
  final bool hasOneSpecialCharacter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w, top: 8.h),
      child: Column(
        children: [
          PasswordValidatorItem(
            isValidate: hasMinimum8Characters,
            title: '8 Characters Minimum',
          ),
          PasswordValidatorItem(
            isValidate: hasOneUpperCharacter,
            title: '1 Upper Character',
          ),
          PasswordValidatorItem(
            isValidate: hasOneLowerCharacter,
            title: '1 Lower Character',
          ),
          PasswordValidatorItem(
            isValidate: hasOneSpecialCharacter,
            title: '1 Special Character',
          ),
        ],
      ),
    );
  }
}
