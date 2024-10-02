import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship/core/di/dependency_injection.dart';
import 'package:mentorship/core/routing/routes.dart';
import 'package:mentorship/features/home/logic/home_cubit.dart';
import 'package:mentorship/features/home/ui/screens/home_screen.dart';
import 'package:mentorship/features/home/ui/screens/product_details_screen.dart';
import 'package:mentorship/features/main/logic/cubit/main_cubit.dart';
import 'package:mentorship/features/main/ui/screens/main_screen.dart';
import 'package:mentorship/features/signup/ui/screens/signup_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // This arguments to be passed in any screen like this ( arguments as ClassName )
    // final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.mainScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => MainCubit(),
            child: MainScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<HomeCubit>(),
            child: const HomeScreen(),
          ),
        );

      case Routes.productDetailsScreen:
        final productId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => ProductDetailsScreen(
              productId: productId, homeCubit: getIt<HomeCubit>()),
        );

      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
        );
      default:
        return null;
    }
  }
}
