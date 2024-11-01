import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:mentorship/core/helpers/constants.dart';
import 'package:mentorship/core/helpers/shared_prefrances_helper.dart';
import 'package:meta/meta.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationInitial());

  String locale = SharedPreferencesValues.arabic;

  cacheUserLanguage() async {
    await SharedPreferencesHelper.setData(
        SharedPreferencesKey.languageKey, locale);
    print(locale);
    emit(CacheUserLanguage());
  }

  void chooseArabicLanguage() {
    locale = SharedPreferencesValues.arabic;
    cacheUserLanguage();
    emit(ArabicLanguage());
  }

  void chooseEnglishLanguage() {
    locale = SharedPreferencesValues.english;
    cacheUserLanguage();
    emit(EnglishLanguage());
  }

  getCachedUserLanguage() async {
    locale = (await SharedPreferencesHelper.getData(
            SharedPreferencesKey.languageKey)) ??
        SharedPreferencesValues.english;
    emit(GetCachedUserLanguage());
  }
}
