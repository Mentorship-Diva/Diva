// Bottom navigation bar items
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentorship/core/Localization/localization_cubit.dart';
import 'package:mentorship/core/di/dependency_injection.dart';
import 'package:mentorship/core/helpers/constants.dart';
import 'package:mentorship/core/theming/colors.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../generated/l10n.dart';

List<PersistentBottomNavBarItem> navBarItems(int index, BuildContext context) {
  return [
    PersistentBottomNavBarItem(
      icon: Padding(
        padding: index == 0 && getIt<LocalizationCubit>().locale == SharedPreferencesValues.english ? EdgeInsets.zero : const EdgeInsets.only(left: 6),
        child: SvgPicture.asset(
          'assets/svgs/home.svg',
          colorFilter: ColorFilter.mode(
            index == 0 ? AppColors.pinkColor : Colors.black,
            BlendMode.srcIn,
          ),
        ),
      ),
      title: S.of(context).home,
      activeColorPrimary: AppColors.pinkColor.withOpacity(0.1),
      inactiveColorPrimary: Colors.black,
      activeColorSecondary: AppColors.pinkColor,
    ),
    PersistentBottomNavBarItem(
        icon: Padding(
          padding: index == 1 && getIt<LocalizationCubit>().locale == SharedPreferencesValues.english ? EdgeInsets.zero : const EdgeInsets.only(left: 6),
          child: SvgPicture.asset(
            'assets/svgs/list.svg',
            colorFilter: ColorFilter.mode(
              index == 1 ? AppColors.pinkColor : Colors.black,
              BlendMode.srcIn,
            ),
          ),
        ),
        title: S.of(context).categories,
        activeColorPrimary: AppColors.pinkColor.withOpacity(0.1),
        inactiveColorPrimary: Colors.black,
        activeColorSecondary: AppColors.pinkColor),
    PersistentBottomNavBarItem(
        icon: Padding(
          padding: index == 2 && getIt<LocalizationCubit>().locale == SharedPreferencesValues.english ? EdgeInsets.zero : const EdgeInsets.only(left: 6),
          child: SvgPicture.asset(
            'assets/svgs/cart.svg',
            colorFilter: ColorFilter.mode(
              index == 2 ? AppColors.pinkColor : Colors.black,
              BlendMode.srcIn,
            ),
          ),
        ),
        title: S.of(context).cart,
        activeColorPrimary: AppColors.pinkColor.withOpacity(0.1),
        inactiveColorPrimary: Colors.black,
        activeColorSecondary: AppColors.pinkColor),
    PersistentBottomNavBarItem(
        icon: Padding(
          padding: index == 3 && getIt<LocalizationCubit>().locale == SharedPreferencesValues.english ? EdgeInsets.zero : const EdgeInsets.only(left: 6),
          child: SvgPicture.asset(
            'assets/svgs/favorite.svg',
            colorFilter: ColorFilter.mode(
              index == 3 ? AppColors.pinkColor : Colors.black,
              BlendMode.srcIn,
            ),
          ),
        ),
        title: S.of(context).wishlist,
        activeColorPrimary: AppColors.pinkColor.withOpacity(0.1),
        inactiveColorPrimary: Colors.black,
        activeColorSecondary: AppColors.pinkColor),
  ];
}
