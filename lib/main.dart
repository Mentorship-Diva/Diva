import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentorship/core/helpers/shared_prefrances_helper.dart';
import 'package:mentorship/core/routing/app_router.dart';
import 'package:mentorship/core/routing/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mentorship/features/profile/data/models/Enums/theme_state.dart';
import 'package:mentorship/features/profile/logic/cubit/app_theme_cubit.dart';
import 'package:mentorship/features/profile/logic/cubit/app_theme_state.dart';
import 'core/di/dependency_injection.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedPreferencesHelper.init();
  FirebaseAuth.instance.setSettings(appVerificationDisabledForTesting: true);
  final themeState = await SharedPreferencesHelper.getData("theme");
  runApp(
    BlocProvider(
      create: (context) => AppThemeCubit()
        ..changeTheme(
            themeState == "light" ? ThemeState.Light : ThemeState.Dark),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state == AppThemeState.light()
                ? ThemeData(
                    textTheme: GoogleFonts.robotoTextTheme(
                        Theme.of(context).textTheme),
                    useMaterial3: true,
                  )
                : ThemeData.dark().copyWith(
                    textTheme: GoogleFonts.robotoTextTheme(
                        Theme.of(context).textTheme.apply(
                              bodyColor: Colors.white,
                              displayColor: Colors.white,
                            )),
                    colorScheme: ColorScheme.dark().copyWith(
                      primary: Colors.pink,
                      onPrimary: Colors.white,
                    ),
                  ),
            initialRoute: Routes.splashScreen,
            onGenerateRoute: AppRouter().generateRoute,
          );
        },
      ),
    );
  }
}
