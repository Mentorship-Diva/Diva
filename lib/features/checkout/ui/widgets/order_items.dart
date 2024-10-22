import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/theming/text_styles.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../cart/logic/cart_cubit.dart';

class OrderItems extends StatelessWidget {
  const OrderItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: getIt<CartCubit>().cartItemModels.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    getIt<CartCubit>().cartItemModels[index].image.toString(),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "${getIt<CartCubit>().cartItemModels[index].price} L.E",
                  style: AppTextStyles.font16BlackSemiBold,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
