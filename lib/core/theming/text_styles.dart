import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static TextStyle font24BlackSemiBold(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle font18PrimaryColorMedium(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle font14WhiteSemiBold(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle font18PrimaryColorBold(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle font16BlackSemiBold(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle font16BlackWeight400(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle font24BlackWeight600(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle font18Black400(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
      fontSize: 18.sp,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle font18Pink400(BuildContext context) {
    return TextStyle(
      color: Colors.pink,
      fontSize: 18.sp,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle font18LightGrey400(BuildContext context) {
    return TextStyle(
      color: Colors.grey,
      fontSize: 18.sp,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle font18White400(BuildContext context) {
    return TextStyle(
      color: Colors.white,
      fontSize: 18.sp,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle font14Black400(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle font14Weight400Black(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
    );
  }

  static TextStyle font14Weight400FadedBlack(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Theme.of(context).brightness == Brightness.dark ? Colors.white.withOpacity(0.6) : Colors.black.withOpacity(0.6),
    );
  }

  static TextStyle font14Weight400Grey(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.grey,
    );
  }

  static TextStyle font14WeightBoldBlack(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
    );
  }

  static TextStyle font12DarkGrey400(BuildContext context) {
    return TextStyle(
      color: Colors.grey,
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle font14Pink400UnderLine(BuildContext context) {
    return TextStyle(
      color: Colors.pink,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.underline,
      decorationColor: Colors.pink,
    );
  }

  static TextStyle font12Blue400UnderLine(BuildContext context) {
    return TextStyle(
      color: Colors.blue,
      fontSize: 12.sp,
      fontWeight: FontWeight.w300,
      decoration: TextDecoration.underline,
      decorationColor: Colors.blue,
    );
  }

  static TextStyle font20White500(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle font16Pink400(BuildContext context) {
    return TextStyle(
      color: Colors.pink,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle font14Pink400(BuildContext context) {
    return TextStyle(
      color: Colors.pink,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle font14Blue400UnderLine(BuildContext context) {
    return TextStyle(
      color: Colors.blue,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.underline,
    );
  }

  static TextStyle font12Grey400(BuildContext context) {
    return TextStyle(
      color: Colors.grey,
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle font14PinkRegular(BuildContext context) {
    return TextStyle(
      color: Colors.pink,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle font14Black500(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle font18BlackBold(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle font16Black400(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle font18Grey400(BuildContext context) {
    return TextStyle(
      color: Colors.grey,
      fontSize: 18.sp,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle font24Black400Libre(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
      fontSize: 24.sp,
      fontWeight: FontWeight.w400,
    );
  }
}

