import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/theming/text_styles.dart';
import 'package:mentorship/features/profile/ui/widgets/account_settings.dart';
import 'package:mentorship/features/profile/ui/widgets/privacy_settings.dart';
import 'package:mentorship/features/profile/ui/widgets/profile_app_bar.dart';
import 'package:mentorship/features/profile/ui/widgets/user_account_info.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: ListView(children: [
          const ProfileAppBar(),
          const UserAccountInfo(),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child:
                  Text("Account", style: AppTextStyles.font18PrimaryColorBold(context))),
          const AccountSettings(),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child:
                  Text("Privacy", style: AppTextStyles.font18PrimaryColorBold(context))),
          const PrivacySettings(),
        ]),
      ),
    );
  }
}
