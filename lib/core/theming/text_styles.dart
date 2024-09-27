import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentorship/core/theming/colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  // font - size - color - weight - style if exist
  static TextStyle font24Black400Libre = GoogleFonts.libreBaskerville(
    color: AppColors.blackColor,
    fontSize: 24.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle font18Black400 = TextStyle(
    color: AppColors.blackColor,
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle font18Pink400 = TextStyle(
    color: AppColors.mainColor,
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle font18LightGrey400 = TextStyle(
    color: AppColors.lightGreyColor,
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle font18White400 = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle font14Black400 = TextStyle(
    color: AppColors.blackColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
}
