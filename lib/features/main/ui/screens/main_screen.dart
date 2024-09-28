import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocProvider(
      create: (_) => MainCubit(),
      child: BlocBuilder<MainCubit, int>(
        builder: (context, currentIndex) {
          return PersistentTabView(
            context,
            controller: _controller,
            screens: navBarScreens(),
            items: navBarItems(_controller.index),
            navBarHeight: 70,
            backgroundColor: Colors.white, // Default background color
            handleAndroidBackButtonPress: true, // Back button handling
            resizeToAvoidBottomInset: true,
            navBarStyle: NavBarStyle.style7, // Choose the style you like
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
