import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/theming/colors.dart';
import 'package:mentorship/core/theming/text_styles.dart';

class CalculatingCost extends StatelessWidget {
  const CalculatingCost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Subtotal", style: AppTextStyles.font18Grey400(context)),
              Text("1,250 L.E", style: AppTextStyles.font18Grey400(context)),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Discount",
                style: AppTextStyles.font18Grey400(context),
              ),
              Text(
                "-200 L.E",
                style: AppTextStyles.font18Pink400(context),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Delivery fee",
                style: AppTextStyles.font18Grey400(context),
              ),
              Text(
                "40 L.E",
                style: AppTextStyles.font18Grey400(context),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Divider(color: AppColors.lightGreyColor),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("TOTAL", style: AppTextStyles.font18BlackBold(context),),
              Text("1,050 L.E", style: AppTextStyles.font18BlackBold( context),),
            ],
          ),
        ],
      ),
    );
  }
}
