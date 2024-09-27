import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';

class PasswordValidatorItem extends StatelessWidget {
  const PasswordValidatorItem({
    super.key,
    required this.isValidate,
    required this.title,
  });

  final bool isValidate;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 2.5,
          backgroundColor:
          isValidate ? AppColors.greenColor : AppColors.redColor,
        ),
        SizedBox(
          width: 6.w,
        ),
        Text(
          title,
          style: AppTextStyles.font14Black400.copyWith(
            color: isValidate ? AppColors.greenColor : AppColors.redColor,
          ),
        )
      ],
    );
  }
}
