import 'package:bloc/bloc.dart';
import 'package:mentorship/core/helpers/shared_prefrances_helper.dart';
import 'package:mentorship/features/profile/data/models/Enums/theme_state.dart';
import 'package:mentorship/features/profile/logic/cubit/app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppThemeState.initial());

  void changeTheme(ThemeState themeState) {
    switch (themeState) {
      case ThemeState.Light:
        SharedPreferencesHelper.setData("theme", "light");
        emit(AppThemeState.light());

        break;
      case ThemeState.Dark:
        SharedPreferencesHelper.setData("theme", "dark");
        emit(AppThemeState.dark());

        break;
      default:
        break;
    }
  }
}
