import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/theming/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // font - size - color - weight - style if exist
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
  static TextStyle font14Weight400Black = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
  static TextStyle font14Weight400FadedBlack = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.black54,
  );
  static TextStyle font14Weight400Grey = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.greyColor,
  );
  static TextStyle font14WeightBoldBlack = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
}
