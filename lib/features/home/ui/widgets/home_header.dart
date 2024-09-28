import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentorship/core/theming/text_styles.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.deepPurple,
              radius: 25.r,
              child: Image.asset(
                'assets/images/user.png',
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              "Welcome, Ahmed",
              style: AppTextStyles.font14Weight400Black,
            ),
          ],
        ),
        Row(
          children: [
            SvgPicture.asset(
              "assets/svgs/notification.svg",
              width: 28.w,
            ),
          ],
        )
      ]),
    );
  }
}
