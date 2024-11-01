part of 'localization_cubit.dart';

@immutable
sealed class LocalizationState {}

final class LocalizationInitial extends LocalizationState {}

final class ArabicLanguage extends LocalizationState {}

final class EnglishLanguage extends LocalizationState {}

final class CacheUserLanguage extends LocalizationState {}

final class GetCachedUserLanguage extends LocalizationState {}
