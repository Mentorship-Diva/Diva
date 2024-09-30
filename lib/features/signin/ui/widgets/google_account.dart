import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentorship/core/theming/assets.dart';

class GoogleAccount extends StatelessWidget {
  const GoogleAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {}, child: SvgPicture.asset(AppAssets.google));
  }
}
