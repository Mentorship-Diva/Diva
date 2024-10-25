import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/colors.dart';
import '../theming/text_styles.dart';

class AppMainButton extends StatelessWidget {
  const AppMainButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.radius,
    this.height,
  });

  final Function() onPressed;
  final String title;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final double? radius;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 30),
          color: backgroundColor ?? AppColors.mainColor,
          border: Border.all(
            color: AppColors.mainColor,
          ),
        ),
        height: height ?? 48.h,
        child: Center(
          child: Text(
            title,
            style: AppTextStyles.font20White500(context).copyWith(
              color: textColor ?? AppColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
