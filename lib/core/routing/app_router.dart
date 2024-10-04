import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentorship/core/di/dependency_injection.dart';
import 'package:mentorship/core/routing/routes.dart';
import 'package:mentorship/features/home/ui/screens/home_screen.dart';
import 'package:mentorship/features/main/logic/cubit/main_cubit.dart';
import 'package:mentorship/features/main/ui/screens/main_screen.dart';
import 'package:mentorship/features/signin/data/repos/signin_repo.dart';
import 'package:mentorship/features/signin/logic/cubit/signin_cubit.dart';
import 'package:mentorship/features/signin/ui/screens/signin_screen.dart';
import 'package:mentorship/features/signup/data/repos/auth_with_google_repo.dart';
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
          builder: (_) => const HomeScreen(),
        );

      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
        );

      case Routes.signinScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SigninCubit(getIt<SignInRepo>(), getIt<AuthWithGoogleRepo>()),
            child: const SigninScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
