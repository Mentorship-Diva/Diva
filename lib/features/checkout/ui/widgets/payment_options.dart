import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/theming/assets.dart';
import 'package:mentorship/core/theming/colors.dart';
import 'package:mentorship/core/theming/text_styles.dart';
import 'package:mentorship/core/widgets/app_text_form_field.dart';

class PaymentOptions extends StatefulWidget {
  const PaymentOptions({super.key});

  @override
  _PaymentOptionsState createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  String? selectedPaymentMethod; 

  final List<Map<String, String>> paymentMethods = [
    {
      'label': 'Master Card',
      'icon': AppAssets.masterCard,
    },
    {
      'label': 'Apple Pay',
      'icon': AppAssets.applePay,
    },
    {
      'label': 'Cash',
      'icon': AppAssets.cashPay,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding:
              EdgeInsets.symmetric(horizontal: 12.w), 
          decoration: BoxDecoration(
            border: Border.all(
                color: AppColors.lightGreyColor), 
            borderRadius: BorderRadius.circular(12.r), 
          ),
          child: DropdownButton<String>(
            value: selectedPaymentMethod,
            hint: Text("Select Payment Method"),
            isExpanded: true,
            underline: SizedBox(), 
            icon: Icon(Icons.arrow_drop_down),
            items: paymentMethods.map((method) {
              return DropdownMenuItem<String>(
                value: method['label'],
                child: Row(
                  children: [
                    Image.asset(method['icon']!, width: 25.w, height: 25.h),
                    SizedBox(width: 10.w),
                    Text(method['label']!, style: AppTextStyles.font14Black400(context)),
                  ],
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedPaymentMethod = value;
              });
            },
          ),
        ),
        if (selectedPaymentMethod != null)
          Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: AppTextFormField(
                hintText: "Enter card number",
                borderRadius: 12.r,
                keyboardType: TextInputType.number,
              )),
      ],
    );
  }
}
