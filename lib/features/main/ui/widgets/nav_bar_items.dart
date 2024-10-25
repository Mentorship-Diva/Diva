// Bottom navigation bar items
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentorship/core/theming/colors.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

List<PersistentBottomNavBarItem> navBarItems(bool isDarkTheme, int index) {
  return [
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(
        'assets/svgs/home.svg',
        colorFilter: ColorFilter.mode(
          index == 0
              ? AppColors.pinkColor
              : isDarkTheme
                  ? Colors.white
                  : Colors.black,
          BlendMode.srcIn,
        ),
      ),
      title: "Home",
      activeColorPrimary: AppColors.pinkColor.withOpacity(0.1),
      inactiveColorPrimary: isDarkTheme ? Colors.white : Colors.black,
      activeColorSecondary: AppColors.pinkColor,
    ),
    PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/svgs/list.svg',
          colorFilter: ColorFilter.mode(
            index == 1
                ? AppColors.pinkColor
                : isDarkTheme
                    ? Colors.white
                    : Colors.black,
            BlendMode.srcIn,
          ),
        ),
        title: "Categories",
        activeColorPrimary: AppColors.pinkColor.withOpacity(0.1),
        inactiveColorPrimary: isDarkTheme ? Colors.white : Colors.black,
        activeColorSecondary: AppColors.pinkColor),
    PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/svgs/cart.svg',
          colorFilter: ColorFilter.mode(
            index == 2
                ? AppColors.pinkColor
                : isDarkTheme
                    ? Colors.white
                    : Colors.black,
            BlendMode.srcIn,
          ),
        ),
        title: "Cart",
        activeColorPrimary: AppColors.pinkColor.withOpacity(0.1),
        inactiveColorPrimary: isDarkTheme ? Colors.white : Colors.black,
        activeColorSecondary: AppColors.pinkColor),
    PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/svgs/favorite.svg',
          colorFilter: ColorFilter.mode(
            index == 3
                ? AppColors.pinkColor
                : isDarkTheme
                    ? Colors.white
                    : Colors.black,
            BlendMode.srcIn,
          ),
        ),
        title: "Wishlist",
        activeColorPrimary: AppColors.pinkColor.withOpacity(0.1),
        inactiveColorPrimary: isDarkTheme ? Colors.white : Colors.black,
        activeColorSecondary: AppColors.pinkColor),
  ];
}
