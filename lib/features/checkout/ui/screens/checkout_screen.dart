import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/theming/colors.dart';
import 'package:mentorship/core/theming/text_styles.dart';
import 'package:mentorship/core/widgets/app_main_button.dart';
import 'package:mentorship/core/widgets/app_text_form_field.dart';
import 'package:mentorship/core/widgets/toast.dart';
import 'package:mentorship/features/checkout/ui/screens/payment_screen.dart';
import 'package:mentorship/features/checkout/ui/widgets/address_widget.dart';
import 'package:mentorship/features/checkout/ui/widgets/calculating_cost.dart';
import 'package:mentorship/features/checkout/ui/widgets/checkout_app_bar.dart';
import 'package:mentorship/features/checkout/ui/widgets/order_items.dart';
import 'package:mentorship/features/checkout/ui/widgets/payment_options.dart';

import '../../../../generated/l10n.dart';

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
            Text(S.of(context).orderItems, style: AppTextStyles.font18BlackBold),
            OrderItems(),
            SizedBox(height: 8.h),
            Text(S.of(context).saveOnYourItems, style: AppTextStyles.font18BlackBold),
            AppTextFormField(
              hintText: S.of(context).enterYourVoucherCode,
              borderRadius: 12.r,
              prefixIcon: Icon(
                Icons.local_offer_outlined,
                color: AppColors.mainPinkColor,
              ),
            ),
            SizedBox(height: 16.h),
            Text(S.of(context).payWith, style: AppTextStyles.font18BlackBold),
            PaymentOptions(),
            SizedBox(height: 8.h),
            Text(S.of(context).calculatingCoast, style: AppTextStyles.font18BlackBold),
            CalculatingCost(),
            SizedBox(height: 8.h),
            AppMainButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PaymentScreen();
                  }));
                },
                title: "Pay Now"),
                  showToast(message: "Successful Order");
                },
                title: S.of(context).placeOrder),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}
