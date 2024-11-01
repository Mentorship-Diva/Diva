import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/di/dependency_injection.dart';
import 'package:mentorship/core/theming/text_styles.dart';
import 'package:mentorship/features/profile/ui/widgets/account_settings.dart';
import 'package:mentorship/features/profile/ui/widgets/privacy_settings.dart';
import 'package:mentorship/features/profile/ui/widgets/profile_app_bar.dart';
import 'package:mentorship/features/profile/ui/widgets/switch_language_button.dart';
import 'package:mentorship/features/profile/ui/widgets/user_account_info.dart';
import '../../../../generated/l10n.dart';

import '../../logic/profile_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: getIt<ProfileCubit>()..getCachedUserData(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: ListView(children: [
            const ProfileAppBar(),
            const UserAccountInfo(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Text(
                "Account",
                style: AppTextStyles.font18PrimaryColorBold,
              ),
            ),
            const AccountSettings(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Text(
                "Privacy",
                style: AppTextStyles.font18PrimaryColorBold,
              ),
            ),
            const PrivacySettings(),
          ]),
        ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: ListView(children: [
          const ProfileAppBar(),
          const UserAccountInfo(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Text(
              S.of(context).account,
              style: AppTextStyles.font18PrimaryColorBold,
            ),
          ),
          const AccountSettings(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Text(
              S.of(context).setting,
              style: AppTextStyles.font18PrimaryColorBold,
            ),
          ),
          const PrivacySettings(),
          SwitchLanguageButton(),
        ]),
      ),
    );
  }
}
