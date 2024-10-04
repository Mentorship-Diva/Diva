import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mentorship/core/networking/dio_factory.dart';
import 'package:mentorship/features/home/data/apis/home_api_service.dart';
import 'package:mentorship/features/home/data/repo/home_repo.dart';
import 'package:mentorship/features/home/logic/home_cubit.dart';
import 'package:mentorship/features/signin/data/repos/signin_repo.dart';
import 'package:mentorship/features/signin/logic/cubit/signin_cubit.dart';
import 'package:mentorship/features/signup/data/repos/auth_with_google_repo.dart';
import '../../features/signup/data/repos/signup_repo.dart';
import '../../features/signup/logic/cubits/signup_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt
      .registerLazySingleton<HomeRepo>(() => HomeRepo(getIt<HomeApiService>()));
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt<HomeRepo>()));
  // signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo());
  getIt.registerLazySingleton<AuthWithGoogleRepo>(() => AuthWithGoogleRepo());
  getIt.registerFactory<SignupCubit>(
    () => SignupCubit(
      getIt<SignupRepo>(),
      getIt<AuthWithGoogleRepo>(),
    ),
  );

  // signin
  getIt.registerLazySingleton<SignInRepo>(() => SignInRepo());
  getIt.registerFactory<SigninCubit>(
      () => SigninCubit(getIt<SignInRepo>(), getIt<AuthWithGoogleRepo>()));
}
