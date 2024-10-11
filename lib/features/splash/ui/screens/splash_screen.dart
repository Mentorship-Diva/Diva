import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mentorship/core/helpers/extensions.dart';
import 'package:mentorship/core/routing/routes.dart';
import 'package:mentorship/core/theming/colors.dart';

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
          controller.forward().then((_) {
            context.pushReplacementNamed(Routes.signinScreen);
          });
        });
      });
    });
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
                  'assets/svgs/splash_one.svg',
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
                        'assets/svgs/splash_two.svg',
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
