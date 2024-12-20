import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship/core/di/dependency_injection.dart';
import 'package:mentorship/core/routing/routes.dart';
import 'package:mentorship/core/theming/colors.dart';
import 'package:mentorship/features/home/logic/home_cubit.dart';
import 'package:mentorship/features/main/logic/cubit/main_cubit.dart';
import 'package:mentorship/features/main/ui/widgets/nav_bar_items.dart';
import 'package:mentorship/features/main/ui/widgets/nav_bar_screens.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainScreen extends StatelessWidget {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainCubit>(
          create: (context) => MainCubit(),
        ),
        BlocProvider<HomeCubit>(
          create: (context) => getIt<HomeCubit>(),
        ),
      ],
      child: BlocBuilder<MainCubit, int>(
        builder: (context, currentIndex) {
          return PersistentTabView(
            context,
            controller: _controller,
            screens: navBarScreens(),
            items: navBarItems(_controller.index, context),
            navBarHeight: 70,
            backgroundColor: Colors.white,
            // Default background color
            handleAndroidBackButtonPress: true,
            // Back button handling
            resizeToAvoidBottomInset: true,
            navBarStyle: NavBarStyle.style7,
            floatingActionButton: _controller.index == 0
                ? Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: FloatingActionButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.addProductScreen);
                      },
                      shape: CircleBorder(),
                      child: Icon(
                        Icons.add,
                        color: AppColors.whiteColor,
                        size: 32,
                      ),
                      backgroundColor: AppColors.mainColor,
                    ),
                )
                : null,
            onItemSelected: (index) {
              context.read<MainCubit>().changeTab(index);
              _controller.index = index;
            },
          );
        },
      ),
    );
  }
}
