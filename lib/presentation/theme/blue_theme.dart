import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class BlueTheme {
  final TextTheme textTheme;

  const BlueTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff0061a4),
      surfaceTint: Color(0xff0061a4),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff2196f3),
      onPrimaryContainer: Color(0xff002c4f),
      secondary: Color(0xFFFFC107),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffa000),
      onSecondaryContainer: Color(0xff673e00),
      tertiary: Color(0xff466435),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff5e7d4b),
      onTertiaryContainer: Color(0xfff8ffee),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff8f9ff),
      onSurface: Color(0xff181c22),
      onSurfaceVariant: Color(0xff404752),
      outline: Color(0xff707883),
      outlineVariant: Color(0xffbfc7d4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3137),
      inversePrimary: Color(0xff9ecaff),
      primaryFixed: Color(0xffd1e4ff),
      onPrimaryFixed: Color(0xff001d36),
      primaryFixedDim: Color(0xff9ecaff),
      onPrimaryFixedVariant: Color(0xff00497d),
      secondaryFixed: Color(0xffffddba),
      onSecondaryFixed: Color(0xff2b1700),
      secondaryFixedDim: Color(0xffffb865),
      onSecondaryFixedVariant: Color(0xff663d00),
      tertiaryFixed: Color(0xffc9edb1),
      onTertiaryFixed: Color(0xff072100),
      tertiaryFixedDim: Color(0xffaed197),
      onTertiaryFixedVariant: Color(0xff314e21),
      surfaceDim: Color(0xffd7dae2),
      surfaceBright: Color(0xfff8f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff1f3fc),
      surfaceContainer: Color(0xffebeef6),
      surfaceContainerHigh: Color(0xffe5e8f0),
      surfaceContainerHighest: Color(0xffdfe2ea),
    );
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff9ecaff),
      surfaceTint: Color(0xff9ecaff),
      onPrimary: Color(0xff003258),
      primaryContainer: Color(0xff2196f3),
      onPrimaryContainer: Color(0xff002c4f),
      secondary: Color(0xFFF4C73D),
      onSecondary: Color(0xff482a00),
      secondaryContainer: Color(0xffffa000),
      onSecondaryContainer: Color(0xff673e00),
      tertiary: Color(0xffaed197),
      onTertiary: Color(0xff1b370d),
      tertiaryContainer: Color(0xff799a65),
      onTertiaryContainer: Color(0xff143007),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff0f1419),
      onSurface: Color(0xffdfe2ea),
      onSurfaceVariant: Color(0xffbfc7d4),
      outline: Color(0xff89919d),
      outlineVariant: Color(0xff404752),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdfe2ea),
      inversePrimary: Color(0xff0061a4),
      primaryFixed: Color(0xffd1e4ff),
      onPrimaryFixed: Color(0xff001d36),
      primaryFixedDim: Color(0xff9ecaff),
      onPrimaryFixedVariant: Color(0xff00497d),
      secondaryFixed: Color(0xffffddba),
      onSecondaryFixed: Color(0xff2b1700),
      secondaryFixedDim: Color(0xffffb865),
      onSecondaryFixedVariant: Color(0xff663d00),
      tertiaryFixed: Color(0xffc9edb1),
      onTertiaryFixed: Color(0xff072100),
      tertiaryFixedDim: Color(0xffaed197),
      onTertiaryFixedVariant: Color(0xff314e21),
      surfaceDim: Color(0xff0f1419),
      surfaceBright: Color(0xff353940),
      surfaceContainerLowest: Color(0xff0a0e14),
      surfaceContainerLow: Color(0xff181c22),
      surfaceContainer: Color(0xff1c2026),
      surfaceContainerHigh: Color(0xff262a30),
      surfaceContainerHighest: Color(0xff31353b),
    );
  }

  static ThemeData dark() {
    return theme(darkScheme());
  }

  static ThemeData light() {
    return theme(lightScheme());
  }

  static ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    // textTheme: GoogleFonts.aBeeZeeTextTheme(TextTheme()),
    textTheme: GoogleFonts.markaziTextTextTheme(TextTheme()),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
  );

  List<ExtendedColor> get extendedColors => [];
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
      surface: surface,
      onSurface: onSurface,
      surfaceContainerHighest: surfaceVariant,
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
