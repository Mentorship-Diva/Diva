import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/theming/colors.dart';
import 'package:mentorship/core/theming/text_styles.dart';

class UserAccountInfo extends StatelessWidget {
  const UserAccountInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      decoration:  BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white),
      child: ListTile(
          onTap: () {},
          leading: CircleAvatar(
              radius: 20.r,
              backgroundColor: AppColors.lightPinkColor,
              child: Text("DM", style: AppTextStyles.font18PrimaryColorMedium(context))),
          title:  Text('Hello, Dmitry Mikhailov',
              style: AppTextStyles.font16BlackSemiBold(context)),
          subtitle: Text('5MlTf@example.com',style: AppTextStyles.font12Grey400(context),),
          trailing: Container(
            width: 43.w,
            height: 20.h,
            decoration: const BoxDecoration(
                color: AppColors.mainPinkColor,
                borderRadius: BorderRadius.all(Radius.circular(13))),
            child: Center(
                child: Text('Edit', style: AppTextStyles.font14WhiteSemiBold(context))),
          )),
    );
  }
}
