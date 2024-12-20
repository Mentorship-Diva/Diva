import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/theming/colors.dart';
import 'package:mentorship/core/theming/text_styles.dart';

import '../../../../generated/l10n.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../cart/logic/cart_cubit.dart';

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
              Text(S.of(context).subtotal, style: AppTextStyles.font18Grey400),
              Text("1,250 L.E", style: AppTextStyles.font18Grey400),
              Text("Subtotal", style: AppTextStyles.font18Grey400),
              Text("${getIt<CartCubit>().getTotalPrice()} L.E", style: AppTextStyles.font18Grey400),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).discount,
                style: AppTextStyles.font18Grey400,
              ),
              Text(
                "-${getIt<CartCubit>().discount} L.E",
                style: AppTextStyles.font18Pink400,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).deliveryFee,
                style: AppTextStyles.font18Grey400,
              ),
              Text(
                "${getIt<CartCubit>().deliveryFee} L.E",
                style: AppTextStyles.font18Grey400,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Divider(color: AppColors.lightGreyColor),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(S.of(context).total, style: AppTextStyles.font18BlackBold,),
              Text("1,050 L.E", style: AppTextStyles.font18BlackBold,),
              Text("TOTAL", style: AppTextStyles.font18BlackBold,),
              Text("${getIt<CartCubit>().getTotalPrice() - getIt<CartCubit>().discount + getIt<CartCubit>().deliveryFee}  L.E", style: AppTextStyles.font18BlackBold,),
            ],
          ),
        ],
      ),
    );
  }
}
