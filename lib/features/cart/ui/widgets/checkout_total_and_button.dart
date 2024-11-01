import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/di/dependency_injection.dart';
import 'package:mentorship/core/theming/colors.dart';
import 'package:mentorship/core/widgets/toast.dart';
import 'package:mentorship/features/cart/logic/cart_cubit.dart';
import 'package:mentorship/features/checkout/ui/screens/checkout_screen.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/app_main_button.dart';
import '../../../../generated/l10n.dart';

class CheckoutTotalAndButton extends StatelessWidget {
  const CheckoutTotalAndButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Column(
          children: [
            Text(
              S.of(context).total,
              style: AppTextStyles.font14Black500,
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'TOTAL',
                  style: AppTextStyles.font14Black500,
                ),
                Text(
                  '${getIt<CartCubit>().getTotalPrice()} L.E',
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            AppMainButton(
              backgroundColor: getIt<CartCubit>().cartItemModels.isNotEmpty
                  ? AppColors.mainColor
                  : AppColors.darkGreyColor,
              borderColor: getIt<CartCubit>().cartItemModels.isNotEmpty
                  ? AppColors.mainColor
                  : AppColors.darkGreyColor,
              onPressed: () {
                if (getIt<CartCubit>().cartItemModels.isNotEmpty) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CheckoutScreen()));
                } else {
                  showToast(message: 'Cart is empty!');
                }
              },
              title: 'Checkout',
            ),
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        AppMainButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CheckoutScreen()));
          },
          title: S.of(context).checkout,
        ),
      ],
        );
      },
    );
  }
}
