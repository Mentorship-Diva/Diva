import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';

class OrTextWithHorizontalDivider extends StatelessWidget {
  const OrTextWithHorizontalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: .4,
            color: AppColors.lightGreyColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            'OR',
            style: AppTextStyles.font18LightGrey400,
          ),
        ),
        Expanded(
          child: Container(
            height: .4,
            color: AppColors.lightGreyColor,
          ),
        ),
      ],
    );
  }
}