import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/theming/colors.dart';

class TextStyles {
  static TextStyle font24BlackSemiBold = TextStyle(
    color: Colors.black,
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle font18PrimaryColorMedium = TextStyle(
    color: AppColors.mainPinkColor,
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font14WhiteSemiBold = TextStyle(
    color: Colors.white,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle font18PrimaryColorBold = TextStyle(
    color: AppColors.mainPinkColor,
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle font16BlackSemiBold = TextStyle(
    color: Colors.black,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );
}
