import 'package:flutter/material.dart';

import '../../../../core/Localization/localization_cubit.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/theming/assets.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../generated/l10n.dart';

class SwitchLanguageButton extends StatefulWidget {
  const SwitchLanguageButton({super.key});

  @override
  State<SwitchLanguageButton> createState() => _SwitchLanguageButtonState();
}

class _SwitchLanguageButtonState extends State<SwitchLanguageButton> {

  bool isEnglish = getIt<LocalizationCubit>().locale == SharedPreferencesValues.english;
  Duration duration = Duration(milliseconds: 1000);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
      ),
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
              Text(S.of(context).language,
                style: AppTextStyles.font16BlackSemiBold,
              ),
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
    );
  }
}
