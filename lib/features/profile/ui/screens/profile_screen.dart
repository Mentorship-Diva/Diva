import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/Localization/localization_cubit.dart';
import 'package:mentorship/core/di/dependency_injection.dart';
import 'package:mentorship/core/helpers/constants.dart';
import 'package:mentorship/core/theming/assets.dart';
import 'package:mentorship/core/theming/colors.dart';
import 'package:mentorship/core/theming/text_styles.dart';
import 'package:mentorship/features/profile/ui/widgets/account_settings.dart';
import 'package:mentorship/features/profile/ui/widgets/privacy_settings.dart';
import 'package:mentorship/features/profile/ui/widgets/profile_app_bar.dart';
import 'package:mentorship/features/profile/ui/widgets/user_account_info.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isEnglish = getIt<LocalizationCubit>().locale == SharedPreferencesValues.english;
  Duration duration = Duration(milliseconds: 1000);

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
                  Text("Account", style: AppTextStyles.font18PrimaryColorBold)),
          const AccountSettings(),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child:
                  Text("Privacy", style: AppTextStyles.font18PrimaryColorBold)),
          const PrivacySettings(),
          Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
            ),
            // height: 80,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.language_outlined),
                    SizedBox(
                      width: 8,
                    ),
                    Text('LANGUAGE'),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isEnglish = !isEnglish;
                    });
                    print(isEnglish);
                    Future.delayed(const Duration(seconds: 1), (){
                      if (getIt<LocalizationCubit>().locale == SharedPreferencesValues.english) {
                        getIt<LocalizationCubit>().chooseArabicLanguage();
                      } else {
                        getIt<LocalizationCubit>().chooseEnglishLanguage();
                      }
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                      color: AppColors.lightPinkColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: Offset(2, 2), // الظل السفلي
                          blurRadius: 5,
                        ),
                        BoxShadow(
                          color: Colors.white.withOpacity(0.8),
                          offset: Offset(-2, -2), // الظل العلوي
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Center(
                      child: Stack(
                        children: [
                          AnimatedAlign(
                              duration: duration,
                              alignment: isEnglish
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: Text(isEnglish ? 'EN' : 'AR')),
                          AnimatedAlign(
                            duration: duration,
                            alignment: !isEnglish
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Image.asset(isEnglish ? AppAssets.en : AppAssets.ar, width: 30,),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

        ]),
      ),
    );
  }
}
