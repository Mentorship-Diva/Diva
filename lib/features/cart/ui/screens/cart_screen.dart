import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../generated/l10n.dart';
import '../widgets/cart_items_list.dart';
import '../widgets/checkout_total_and_button.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        // To avoid tinted color when screen scrolls.
        backgroundColor: AppColors.backgroundColor,
        surfaceTintColor: AppColors.backgroundColor,
        title: Text(
          S.of(context).cart,
          style: AppTextStyles.font24BlackSemiBold,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: CartItemsList(),
              ),
              CheckoutTotalAndButton(),
            ],
          ),
        ),
      ),
    );
  }
}
