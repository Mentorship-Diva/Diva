import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/theming/assets.dart';
import 'package:mentorship/core/theming/colors.dart';
import 'package:mentorship/core/theming/text_styles.dart';

import '../../../../generated/l10n.dart';

class AddressWidget extends StatefulWidget {
  const AddressWidget({super.key});

  @override
  _AddressWidgetState createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  String selectedAddress = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selectedAddress = 'Home';
            });
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
              side: BorderSide(
                color: selectedAddress == 'Home'
                    ? AppColors.mainPinkColor
                    : AppColors.lightGreyColor,
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
                  child: Image.asset(
                    AppAssets.map,
                    fit: BoxFit.cover,
                    height: 106.h,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                  child: Row(
                    children: [
                      Icon(Icons.location_on_outlined,
                          size: 40, color: Colors.black),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(S.of(context).homeLocation,
                                style: AppTextStyles.font18LightGrey400),
                            Text(
                              '33 Othman Ibn Affan st, Apt8...',
                              style: AppTextStyles.font14Black400,
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(S.of(context).edit,
                            style: AppTextStyles.font14Pink400UnderLine),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              selectedAddress = 'Office';
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: selectedAddress == 'Office'
                    ? AppColors.mainPinkColor
                    : AppColors.lightGreyColor,
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.location_on_outlined,
                    size: 40, color: Colors.black),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.of(context).office,
                          style: AppTextStyles.font18LightGrey400),
                      Text(
                        '77 Mohamed Ali st, Apt22...',
                        style: AppTextStyles.font14Black400,
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(S.of(context).edit,
                      style: AppTextStyles.font14Pink400UnderLine),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

