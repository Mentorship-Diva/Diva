import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/theming/colors.dart';
import 'package:mentorship/core/theming/text_styles.dart';

import '../../../../generated/l10n.dart';

class UserAccountInfo extends StatelessWidget {
  const UserAccountInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white),
      child: ListTile(
          onTap: () {},
          leading: CircleAvatar(
              radius: 20.r,
              backgroundColor: AppColors.lightPinkColor,
              child: Text("DM", style: AppTextStyles.font18PrimaryColorMedium)),
          title: Text('${S.of(context).welcome}, Dmitry Mikhailov'),
          subtitle: const Text('5MlTf@example.com'),
          trailing: Container(
            width: 43.w,
            height: 20.h,
            decoration: const BoxDecoration(
                color: AppColors.mainPinkColor,
                borderRadius: BorderRadius.all(Radius.circular(13))),
            child: Center(
                child: Text(S.of(context).edit, style: AppTextStyles.font14WhiteSemiBold)),
          )),
    );
  }
}
