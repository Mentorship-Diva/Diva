import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mentorship/core/networking/dio_factory.dart';
import 'package:mentorship/features/home/data/apis/home_api_service.dart';
import 'package:mentorship/features/home/data/repo/home_repo.dart';
import 'package:mentorship/features/home/logic/home_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt
      .registerLazySingleton<HomeRepo>(() => HomeRepo(getIt<HomeApiService>()));
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt<HomeRepo>()));
}
