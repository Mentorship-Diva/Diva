import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/Localization/localization_cubit.dart';
import 'package:mentorship/core/di/dependency_injection.dart';
import 'package:mentorship/core/helpers/extensions.dart';
import 'package:mentorship/core/routing/routes.dart';
import 'package:mentorship/core/theming/assets.dart';
import 'package:mentorship/core/theming/colors.dart';
import 'package:mentorship/features/signin/logic/signin_cubit.dart';
import 'package:mentorship/features/signin/ui/widgets/do_not_have_account.dart';
import 'package:mentorship/features/signin/ui/widgets/google_signin.dart';
import 'package:mentorship/features/signin/ui/widgets/signin_button.dart';
import 'package:mentorship/features/signin/ui/widgets/signin_with_email_form.dart';
import 'package:mentorship/features/signup/ui/widgets/signup/auth_title_and_image.dart';
import 'package:mentorship/features/signup/ui/widgets/signup/or_text_with_horizontal_divider.dart';

import '../../../../generated/l10n.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  void initState() {
    context.read<SigninCubit>().autoLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                              getIt<LocalizationCubit>().chooseEnglishLanguage();
                              // context.pushAndRemoveUtilsNamed(Routes.splashScreen);
                            },
                            child: Text('ENGLISH'),
                          ),
                          GestureDetector(
                            onTap: (){
                              getIt<LocalizationCubit>().chooseArabicLanguage();
                              // context.pushAndRemoveUtilsNamed(Routes.splashScreen);
                            },
                            child: Text('ARABIC'),
                          ),
                        ],
                      ),
                      AuthTitleAndImage(
                        title: S.of(context).welcomeBack,
                        image: AppAssets.signinIll,
                      ),
                      const SigninWithEmailForm(),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: SigninButton(),
                      ),
                      const OrTextWithHorizontalDivider(),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        child: const GoogleAccount(),
                      ),
                      const DoNotHaveAccount(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
