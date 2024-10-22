import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/features/profile/ui/widgets/custom_settings_list_tile.dart';

import '../../../../generated/l10n.dart';

class PrivacySettings extends StatelessWidget {
  const PrivacySettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white),
        child: Column(children: [
          // CustomSettingsListTile(
          //     onTap: () {},
          //     title: 'Orders',
          //     leading: Icons.shopping_cart_outlined),
          // const Divider(color: AppColors.lightGreyColor, thickness: 0.3),
          // CustomSettingsListTile(
          //     onTap: () {},
          //     title: 'Security',
          //     leading: Icons.security_outlined),
          // const Divider(color: AppColors.lightGreyColor, thickness: 0.3),
          // CustomSettingsListTile(
          //     onTap: () {},
          //     title: 'Privacy & Cookies Policy',
          //     leading: Icons.privacy_tip_outlined),
          // const Divider(color: AppColors.lightGreyColor, thickness: 0.3),
          // CustomSettingsListTile(
          //     onTap: () {},
          //     title: 'Terms & Conditions',
          //     leading: Icons.rate_review_outlined),
          // const Divider(color: AppColors.lightGreyColor, thickness: 0.3),
          // CustomSettingsListTile(
          //     onTap: () {},
          //     title: 'Ratings & Feedback',
          //     leading: Icons.star_outline_rounded),
          // const Divider(color: AppColors.lightGreyColor, thickness: 0.3),
          CustomSettingsListTile(
              onTap: () {},
              title: S.of(context).logout,
              leading: Icons.switch_account_outlined),
        ]),
      ),
    );
  }
}
