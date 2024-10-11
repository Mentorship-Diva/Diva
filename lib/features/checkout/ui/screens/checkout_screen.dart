import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/theming/colors.dart';
import 'package:mentorship/core/theming/text_styles.dart';
import 'package:mentorship/core/widgets/app_main_button.dart';
import 'package:mentorship/core/widgets/app_text_form_field.dart';
import 'package:mentorship/core/widgets/toast.dart';
import 'package:mentorship/features/checkout/ui/widgets/address_widget.dart';
import 'package:mentorship/features/checkout/ui/widgets/calculating_cost.dart';
import 'package:mentorship/features/checkout/ui/widgets/checkout_app_bar.dart';
import 'package:mentorship/features/checkout/ui/widgets/order_items.dart';
import 'package:mentorship/features/checkout/ui/widgets/payment_options.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: ListView(
          children: [
            CheckoutAppBar(),
            SizedBox(height: 8.h),
            AddressWidget(),
            SizedBox(height: 8.h),
            Text("Order Items", style: AppTextStyles.font18BlackBold),
            OrderItems(),
            SizedBox(height: 8.h),
            Text("Save on your order", style: AppTextStyles.font18BlackBold),
            AppTextFormField(
              hintText: "Enter your voucher code",
              borderRadius: 12.r,
              prefixIcon: Icon(
                Icons.local_offer_outlined,
                color: AppColors.mainPinkColor,
              ),
            ),
            SizedBox(height: 16.h),
            Text("Pay with", style: AppTextStyles.font18BlackBold),
            PaymentOptions(),
            SizedBox(height: 8.h),
            Text("Calculating cost", style: AppTextStyles.font18BlackBold),
            CalculatingCost(),
            SizedBox(height: 8.h),
            AppMainButton(
                onPressed: () {
                  showToast(message: "Sccesssful Order");
                },
                title: "Place Order"),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}
