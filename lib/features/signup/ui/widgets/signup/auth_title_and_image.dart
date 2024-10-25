import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorship/core/helpers/extensions.dart';

import '../../../../../core/theming/text_styles.dart';


class AuthTitleAndImage extends StatelessWidget {
  const AuthTitleAndImage({
    super.key,
    required this.title,
    required this.image,
  });

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: AppTextStyles.font24Black400Libre(context),
        ),
        SizedBox(
          height: 24.h,
        ),
        Image.asset(image, height: context.screenHeight / 3.5,),
      ],
    );
  }
}
