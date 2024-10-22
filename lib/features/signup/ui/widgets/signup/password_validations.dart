import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/features/signup/ui/widgets/signup/password_validator_item.dart';

import '../../../../../generated/l10n.dart';

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
            title: S.of(context).eightCharactersMinimum,
          ),
          PasswordValidatorItem(
            isValidate: hasOneUpperCharacter,
            title: S.of(context).oneUpperCharacter,
          ),
          PasswordValidatorItem(
            isValidate: hasOneLowerCharacter,
            title: S.of(context).oneLowerCharacter,
          ),
          PasswordValidatorItem(
            isValidate: hasOneSpecialCharacter,
            title: S.of(context).oneSpecialCharacter,
          ),
        ],
      ),
    );
  }
}