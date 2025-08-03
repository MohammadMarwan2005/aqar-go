import 'package:aqar_go/data/repo/local_data_repo.dart';
import 'package:aqar_go/presentation/lang/app_localization.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../assets/assets.gen.dart';
import '../dark_blue_theme.dart';

part 'theme_cubit.freezed.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final LocalDataRepo _localDataRepo;

  ThemeCubit(this._localDataRepo) : super(const ThemeState.initial()) {
    loadSavedTheme();
  }

  void loadSavedTheme() {
    final theme = getSavedTheme();
    emitAndSaveTheme(theme);
  }

  void switchTheme(BuildContext context) {
    final currentDeviceTheme = deviceDefault(context);
    final current = state.getCurrentTheme();
    final newTheme = current?.getOpposite() ?? currentDeviceTheme.getOpposite();
    emitAndSaveTheme(newTheme);
  }

  static CubitTheme deviceDefault(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    return brightness == Brightness.dark ? CubitTheme.dark : CubitTheme.light;
  }

  static CubitTheme? parse(String? value) {
    try {
      if (value == null) return null;
      return CubitTheme.values.firstWhere(
        (e) => e.name == value,
        orElse: () => CubitTheme.light,
      );
    } on Exception {
      return null;
    }
  }

  CubitTheme? getSavedTheme() {
    final String? savedString = _localDataRepo.getString(
      DataAccessKeys.themeKey,
    );
    // nullable currentSavedTheme theme saved in the state
    final CubitTheme? currentSavedTheme = parse(savedString);
    return currentSavedTheme;
  }

  emitAndSaveTheme(CubitTheme? newTheme) {
    if (newTheme != null) {
      _localDataRepo.setString(newTheme.name, DataAccessKeys.themeKey);
    }
    emit(ThemeState.loaded(theme: newTheme));
  }
}
