import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship/core/di/dependency_injection.dart';
import 'package:mentorship/core/routing/routes.dart';
import 'package:mentorship/features/add_product/logic/cubits/add_product_cubit.dart';
import 'package:mentorship/features/add_product/ui/screens/add_product_screen.dart';
import 'package:mentorship/features/home/logic/home_cubit.dart';
import 'package:mentorship/features/home/ui/screens/home_screen.dart';
import 'package:mentorship/features/home/ui/screens/product_details_screen.dart';
import 'package:mentorship/features/main/logic/cubit/main_cubit.dart';
import 'package:mentorship/features/main/ui/screens/main_screen.dart';
import 'package:mentorship/features/signin/logic/signin_cubit.dart';
import 'package:mentorship/features/signin/ui/screens/signin_screen.dart';
import 'package:mentorship/features/signup/ui/screens/signup_screen.dart';
import 'package:mentorship/features/signup/ui/screens/verification_screen.dart';
import 'package:mentorship/features/splash/ui/screens/splash_screen.dart';

import '../../features/signup/logic/cubits/signup_cubit.dart';

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
          builder: (_) => BlocProvider.value(
            value: getIt<SignupCubit>(),
            child: const SignupScreen(),
          ),
        );
      case Routes.verificationScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<SignupCubit>(),
            child: const VerificationScreen(),
          ),
        );
      case Routes.addProductScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
              value: getIt<AddProductCubit>(), child: const AddProductScreen()),
        );
      case Routes.signinScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<SigninCubit>(),
            child: const SigninScreen(),
          ),
        );
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      default:
        return null;
    }
  }
}
