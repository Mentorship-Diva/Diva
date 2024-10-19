import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/routing/routes.dart';
import 'package:mentorship/features/checkout/ui/screens/checkout_screen.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/app_main_button.dart';

class CheckoutTotalAndButton extends StatelessWidget {
  const CheckoutTotalAndButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'TOTAL',
              style: AppTextStyles.font14Black500,
            ),
            Text(
              '1,550 L.E',
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
          title: 'Checkout',
        ),
      ],
    );
  }
}
