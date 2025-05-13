import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class DarkBlueTheme {
  final TextTheme textTheme;

  const DarkBlueTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xFF002370),
      surfaceTint: Color(0xFF002370),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4292600319),
      onPrimaryContainer: Color(4278196042),
      secondary: Color(4285684748),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4294959240),
      onSecondaryContainer: Color(4280556032),
      tertiary: Color(4285813873),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294956792),
      onTertiaryContainer: Color(4281012779),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      background: Color(4294637823),
      onBackground: Color(4279900961),
      surface: Color(4294637823),
      onSurface: Color(4279900961),
      surfaceVariant: Color(4293059308),
      onSurfaceVariant: Color(4282730063),
      outline: Color(4285888128),
      outlineVariant: Color(4291151568),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281282614),
      inverseOnSurface: Color(4294045943),
      inversePrimary: Color(4289971711),
      primaryFixed: Color(4292600319),
      onPrimaryFixed: Color(4278196042),
      primaryFixedDim: Color(4289971711),
      onPrimaryFixedVariant: Color(4281484408),
      secondaryFixed: Color(4294959240),
      onSecondaryFixed: Color(4280556032),
      secondaryFixedDim: Color(4293051501),
      onSecondaryFixedVariant: Color(4283909376),
      tertiaryFixed: Color(4294956792),
      onTertiaryFixed: Color(4281012779),
      tertiaryFixedDim: Color(4293049308),
      onTertiaryFixedVariant: Color(4284104024),
      surfaceDim: Color(4292532704),
      surfaceBright: Color(4294637823),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294243322),
      surfaceContainer: Color(4293848564),
      surfaceContainerHigh: Color(4293453807),
      surfaceContainerHighest: Color(4293124841),
    );
  }



  static ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4289971711),
      surfaceTint: Color(4289971711),
      onPrimary: Color(4279905888),
      primaryContainer: Color(4281484408),
      onPrimaryContainer: Color(4292600319),
      secondary: Color(4293051501),
      onSecondary: Color(4282134272),
      secondaryContainer: Color(4283909376),
      onSecondaryContainer: Color(4294959240),
      tertiary: Color(4293049308),
      onTertiary: Color(4282525505),
      tertiaryContainer: Color(4284104024),
      onTertiaryContainer: Color(4294956792),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      background: Color(4279374616),
      onBackground: Color(4293124841),
      surface: Color(4279374616),
      onSurface: Color(4293124841),
      surfaceVariant: Color(4282730063),
      onSurfaceVariant: Color(4291151568),
      outline: Color(4287598746),
      outlineVariant: Color(4282730063),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293124841),
      inverseOnSurface: Color(4281282614),
      primaryFixed: Color(4292600319),
      primaryFixedDim: Color(4289971711),
      onPrimaryFixedVariant: Color(4281484408),
      secondaryFixed: Color(4294959240),
      onSecondaryFixed: Color(4280556032),
      secondaryFixedDim: Color(4293051501),
      onSecondaryFixedVariant: Color(4283909376),
      tertiaryFixed: Color(4294956792),
      onTertiaryFixed: Color(4281012779),
      tertiaryFixedDim: Color(4293049308),
      onTertiaryFixedVariant: Color(4284104024),
      surfaceDim: Color(4279374616),
      surfaceBright: Color(4281874751),
      surfaceContainerLowest: Color(4279045651),
      surfaceContainerLow: Color(4279900961),
      surfaceContainer: Color(4280164133),
      surfaceContainerHigh: Color(4280887855),
      surfaceContainerHighest: Color(4281545786),
      inversePrimary: Color(0xFF002370),
      onPrimaryFixed: Color(4278196042),
    );
  }

  static ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }


  static ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: GoogleFonts.markaziTextTextTheme(TextTheme()),
    scaffoldBackgroundColor: colorScheme.background,
    canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
