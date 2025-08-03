part of 'theme_cubit.dart';

@freezed
sealed class ThemeState with _$ThemeState {
  const factory ThemeState.initial() = _ThemeInitial;

  const factory ThemeState.loaded({CubitTheme? theme}) = _ThemeLoaded;
}

enum CubitTheme {
  light,
  dark;

  CubitTheme getOpposite() {
    return switch (this) {
      CubitTheme.light => dark,
      CubitTheme.dark => light,
    };
  }

  ThemeData getThemeData() {
    return switch (this) {
      CubitTheme.light => DarkBlueTheme.light(),
      CubitTheme.dark => DarkBlueTheme.dark(),
    };
  }

  IconData getIconData() {
    return switch (this) {
      CubitTheme.light => Icons.light_mode,
      CubitTheme.dark => Icons.dark_mode,
    };
  }
}

extension X on ThemeState {
  CubitTheme? getCurrentTheme() {
    return switch (this) {
      _ThemeInitial() => null,
      _ThemeLoaded(:final theme) => theme,
    };
  }

  R when<R>({
    required R Function() initial,
    required R Function(CubitTheme? theme) success,
  }) {
    return switch (this) {
      _ThemeInitial() => initial(),
      _ThemeLoaded(:final theme) => success(theme),
    };
  }

  IconData getOppositeIconData(BuildContext context) {
    final deviceTheme = ThemeCubit.deviceDefault(context);
    final currentTheme = getCurrentTheme() ?? deviceTheme;
    return currentTheme.getOpposite().getIconData();
  }

  IconData getIconData(BuildContext context) {
    final deviceTheme = ThemeCubit.deviceDefault(context);
    final currentTheme = getCurrentTheme() ?? deviceTheme;
    return currentTheme.getIconData();
  }

  String getCurrentThemeName(BuildContext context) {
    final currentTheme = getCurrentTheme();
    return (currentTheme?.name ?? "System Default").tr(context);
  }
}
