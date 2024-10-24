import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mentorship/core/helpers/extensions.dart';
import 'package:mentorship/core/routing/routes.dart';
import 'package:mentorship/core/theming/assets.dart';
import 'package:mentorship/core/theming/colors.dart';

import '../../../../core/helpers/shared_prefrances_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  bool isAnimate = false;
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
    animate();
  }

  void animate() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        isAnimate = true;
      });
    }).then((_) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        setState(() {
          controller.forward().then((_) async {
           await afterAnimationNavigate();
          });
        });
      });
    });
  }


  Future<void> afterAnimationNavigate() async {
    bool isLoggedIn = await checkIfUserLoggedIn();
    if(isLoggedIn) {
      debugPrint('LOGGED IN');
      context.pushAndRemoveUtilsNamed(Routes.mainScreen);
    } else {
      debugPrint('NOT LOGGED IN');
      context.pushReplacementNamed(Routes.signinScreen);
    }
  }

  Future<bool> checkIfUserLoggedIn() async {
    String? userId =  await SharedPreferencesHelper.getData('userID');
    return userId != null && userId.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightPinkColor,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedAlign(
              duration: const Duration(milliseconds: 800),
              alignment: isAnimate ? Alignment.center : Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 100.w),
                child: SvgPicture.asset(
                  AppAssets.splashOne,
                ),
              ),
            ),
            Positioned(
              right: context.screenWidth / 3.5,
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return ClipRect(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      widthFactor: animation.value,
                      child: SvgPicture.asset(
                        AppAssets.splashTwo,
                        width: 100.w,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
