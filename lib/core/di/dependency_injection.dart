import 'package:get_it/get_it.dart';
import 'package:mentorship/features/signup/data/repos/signup_with_google_repo.dart';
import '../../features/signup/data/repos/signup_repo.dart';
import '../../features/signup/logic/cubits/signup_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo());
  getIt.registerLazySingleton<SignupWithGoogleRepo>(
      () => SignupWithGoogleRepo());
  getIt.registerFactory<SignupCubit>(
    () => SignupCubit(
      getIt<SignupRepo>(),
      getIt<SignupWithGoogleRepo>(),
    ),
  );
}
