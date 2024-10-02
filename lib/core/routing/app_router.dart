import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship/core/di/dependency_injection.dart';
import 'package:mentorship/core/routing/routes.dart';
import 'package:mentorship/features/add_product/logic/cubits/add_product_cubit.dart';
import 'package:mentorship/features/add_product/ui/screens/add_product_screen.dart';
import 'package:mentorship/features/home/ui/screens/home_screen.dart';
import 'package:mentorship/features/main/logic/cubit/main_cubit.dart';
import 'package:mentorship/features/main/ui/screens/main_screen.dart';
import 'package:mentorship/features/signup/ui/screens/signup_screen.dart';
import 'package:mentorship/features/signup/ui/screens/verification_screen.dart';

import '../../features/signup/logic/cubits/signup_cubit.dart';
import '../di/dependency_injection.dart';

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
          builder: (_) => const HomeScreen(),
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
            value: getIt<AddProductCubit>(),
              child: const AddProductScreen()),
        );
      default:
        return null;
    }
  }
}
