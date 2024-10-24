import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mentorship/core/networking/dio_factory.dart';
import 'package:mentorship/features/add_product/logic/cubits/add_product_cubit.dart';
import 'package:mentorship/features/home/data/apis/home_api_service.dart';
import 'package:mentorship/features/home/data/repo/home_repo.dart';
import 'package:mentorship/features/home/logic/home_cubit.dart';
import 'package:mentorship/features/profile/data/repos/edit_user_repo.dart';
import 'package:mentorship/features/signin/data/repo/signin_repo.dart';
import 'package:mentorship/features/signin/logic/signin_cubit.dart';
import 'package:mentorship/features/signup/data/repos/auth_with_google_repo.dart';
import 'package:mentorship/features/signup/data/repos/signup_with_mobile_repo.dart';
import '../../features/profile/data/repos/logout_repo.dart';
import '../../features/profile/logic/profile_cubit.dart';
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
  getIt.registerLazySingleton<SignupWithPhoneNumberRepo>(
      () => SignupWithPhoneNumberRepo());
  getIt.registerLazySingleton<SignupCubit>(
    () => SignupCubit(
      getIt<SignupRepo>(),
      getIt<AuthWithGoogleRepo>(),
      getIt<SignupWithPhoneNumberRepo>(),
    ),
  );
  getIt.registerLazySingleton<AddProductCubit>(() => AddProductCubit());

  // signin
  getIt.registerLazySingleton<SignInRepo>(() => SignInRepo());
  getIt.registerFactory<SigninCubit>(
      () => SigninCubit(getIt<SignInRepo>(), getIt<AuthWithGoogleRepo>()));

  // Profile
  getIt.registerLazySingleton<LogoutRepo>(() => LogoutRepo());
  getIt.registerLazySingleton<EditUserRepo>(() => EditUserRepo());
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt<LogoutRepo>(), getIt<EditUserRepo>()));
}
