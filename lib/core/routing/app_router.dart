import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship/core/di/dependency_injection.dart';
import 'package:mentorship/core/routing/routes.dart';
import 'package:mentorship/features/home/ui/screens/home_screen.dart';
import 'package:mentorship/features/signup/logic/cubits/signup_cubit.dart';
import 'package:mentorship/features/signup/ui/screens/signup_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // This arguments to be passed in any screen like this ( arguments as ClassName )
    // final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => getIt<SignupCubit>(),
                child: SignupScreen(),
              ),
        );
      default:
        return null;
    }
  }
}