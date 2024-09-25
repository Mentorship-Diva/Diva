import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentorship/core/theming/colors.dart';
import 'package:mentorship/features/home/logic/home_cubit.dart';
import 'package:mentorship/features/home/ui/screens/home_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class ScreensSwitcher extends StatelessWidget {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  ScreensSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: BlocBuilder<HomeCubit, int>(
        builder: (context, currentIndex) {
          return PersistentTabView(
            context,
            controller: _controller,
            screens: _buildScreens(),
            items: _navBarItems(_controller.index),
            navBarHeight: 70,
            backgroundColor: Colors.white, // Default background color
            handleAndroidBackButtonPress: true, // Back button handling
            resizeToAvoidBottomInset: true,
            navBarStyle: NavBarStyle.style7, // Choose the style you like
            onItemSelected: (index) {
              context.read<HomeCubit>().changeTab(index);
              _controller.index = index;
            },
          );
        },
      ),
    );
  }

  // Screens to display
  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const ScreenTwo(),
      const ScreenThree(),
      const ScreenFour(),
    ];
  }

  // Bottom navigation bar items
  List<PersistentBottomNavBarItem> _navBarItems(int index) {
    return [
      PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            'assets/svgs/home.svg',
            colorFilter: ColorFilter.mode(
              index == 0 ? AppColors.pinkColor : Colors.black,
              BlendMode.srcIn,
            ),
          ),
          title: "Home",
          activeColorPrimary: AppColors.pinkColor.withOpacity(0.1),
          inactiveColorPrimary: Colors.black,
          activeColorSecondary: AppColors.pinkColor),
      PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            'assets/svgs/list.svg',
            colorFilter: ColorFilter.mode(
              index == 1 ? AppColors.pinkColor : Colors.black,
              BlendMode.srcIn,
            ),
          ),
          title: "Categories",
          activeColorPrimary: AppColors.pinkColor.withOpacity(0.1),
          inactiveColorPrimary: Colors.black,
          activeColorSecondary: AppColors.pinkColor),
      PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            'assets/svgs/cart.svg',
            colorFilter: ColorFilter.mode(
              index == 2 ? AppColors.pinkColor : Colors.black,
              BlendMode.srcIn,
            ),
          ),
          title: "Cart",
          activeColorPrimary: AppColors.pinkColor.withOpacity(0.1),
          inactiveColorPrimary: Colors.black,
          activeColorSecondary: AppColors.pinkColor),
      PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            'assets/svgs/favorite.svg',
            colorFilter: ColorFilter.mode(
              index == 3 ? AppColors.pinkColor : Colors.black,
              BlendMode.srcIn,
            ),
          ),
          title: "Wishlist",
          activeColorPrimary: AppColors.pinkColor.withOpacity(0.1),
          inactiveColorPrimary: Colors.black,
          activeColorSecondary: AppColors.pinkColor),
    ];
  }
}

// Dummy screens for demonstration
class ScreenFour extends StatelessWidget {
  const ScreenFour({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("4"));
  }
}

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Search Screen"));
  }
}

class ScreenThree extends StatelessWidget {
  const ScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Profile Screen"));
  }
}
