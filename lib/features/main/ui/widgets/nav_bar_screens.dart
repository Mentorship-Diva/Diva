import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship/core/di/dependency_injection.dart';
import 'package:mentorship/features/cart/ui/screens/cart_screen.dart';
import 'package:mentorship/features/categories/ui/screens/categories_screen.dart';
import 'package:mentorship/features/home/logic/home_cubit.dart';
import 'package:mentorship/features/home/ui/screens/home_screen.dart';
import 'package:mentorship/features/wishlist/ui/screens/wishlist_screen.dart';

List<Widget> navBarScreens() {
  return [
    //! Had to provide the HomeCubit to the HomeScreen that way not in routes .. cuz i'm not navigating. i'm switching
    BlocProvider(
      create: (context) => getIt<HomeCubit>()
        ..loadCategories()
        ..loadProducts(),
      child: const HomeScreen(),
    ),
    BlocProvider(
      create: (context) => getIt<HomeCubit>()
        ..loadCategories()
        ..loadProducts(),
      child: const CategoriesScreen(),
    ),
    CartScreen(),
    BlocProvider(
      create: (context) => getIt<HomeCubit>()
        ..loadCategories()
        ..loadProducts(),
      child: const WishlistScreen(),
    ),
  ];
}
