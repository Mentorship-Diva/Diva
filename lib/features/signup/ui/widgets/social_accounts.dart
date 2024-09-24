import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/theming/assets.dart';

class SocialAccounts extends StatelessWidget {
  const SocialAccounts({
    super.key,
    required this.onGoogleTapped,
    required this.onFacebookTapped,
    required this.onAppleTapped,
  });

  final Function()? onGoogleTapped;
  final Function()? onFacebookTapped;
  final Function()? onAppleTapped;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onGoogleTapped,
          child: SvgPicture.asset(AppAssets.google),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: GestureDetector(
            onTap: onFacebookTapped,
            child: SvgPicture.asset(AppAssets.facebook),
          ),
        ),
        GestureDetector(
          onTap: onAppleTapped,
          child: SvgPicture.asset(AppAssets.apple),
        ),
      ],
    );
  }
}
