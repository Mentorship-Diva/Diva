

import 'package:freezed_annotation/freezed_annotation.dart';
part  'app_theme_state.freezed.dart';
@freezed
class AppThemeState with _$AppThemeState {
  const factory AppThemeState.initial() = Initial;
  const factory AppThemeState.light() = Light;
  const factory AppThemeState.dark() = Dark;
}
