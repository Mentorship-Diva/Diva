import 'package:get_it/get_it.dart';
import 'package:mentorship/features/home/logic/home_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit());
}
