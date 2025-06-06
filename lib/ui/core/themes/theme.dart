import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff435e91),
      surfaceTint: Color(0xff435e91),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffd7e2ff),
      onPrimaryContainer: Color(0xff2a4678),
      secondary: Color(0xff89511f),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffdcc4),
      onSecondaryContainer: Color(0xff6c3a08),
      tertiary: Color(0xff156b54),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffa4f2d5),
      onTertiaryContainer: Color(0xff00513e),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff9f9ff),
      onSurface: Color(0xff1a1b20),
      onSurfaceVariant: Color(0xff44474e),
      outline: Color(0xff74777f),
      outlineVariant: Color(0xffc4c6d0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3036),
      inversePrimary: Color(0xffacc7ff),
      primaryFixed: Color(0xffd7e2ff),
      onPrimaryFixed: Color(0xff001a40),
      primaryFixedDim: Color(0xffacc7ff),
      onPrimaryFixedVariant: Color(0xff2a4678),
      secondaryFixed: Color(0xffffdcc4),
      onSecondaryFixed: Color(0xff2f1500),
      secondaryFixedDim: Color(0xffffb77f),
      onSecondaryFixedVariant: Color(0xff6c3a08),
      tertiaryFixed: Color(0xffa4f2d5),
      onTertiaryFixed: Color(0xff002117),
      tertiaryFixedDim: Color(0xff88d6ba),
      onTertiaryFixedVariant: Color(0xff00513e),
      surfaceDim: Color(0xffd9d9e0),
      surfaceBright: Color(0xfff9f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff3f3fa),
      surfaceContainer: Color(0xffededf4),
      surfaceContainerHigh: Color(0xffe8e7ee),
      surfaceContainerHighest: Color(0xffe2e2e9),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff163566),
      surfaceTint: Color(0xff435e91),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff526da1),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff562b00),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff9a5f2c),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff003e2f),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff2a7a63),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff9f9ff),
      onSurface: Color(0xff0f1116),
      onSurfaceVariant: Color(0xff33363e),
      outline: Color(0xff50525a),
      outlineVariant: Color(0xff6a6d75),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3036),
      inversePrimary: Color(0xffacc7ff),
      primaryFixed: Color(0xff526da1),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff395487),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff9a5f2c),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff7d4716),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff2a7a63),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff00614b),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc6c6cd),
      surfaceBright: Color(0xfff9f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff3f3fa),
      surfaceContainer: Color(0xffe8e7ee),
      surfaceContainerHigh: Color(0xffdcdce3),
      surfaceContainerHighest: Color(0xffd1d1d8),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff072b5b),
      surfaceTint: Color(0xff435e91),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff2c497a),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff482200),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff6f3c0b),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff003326),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff005440),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff9f9ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff292c33),
      outlineVariant: Color(0xff464951),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3036),
      inversePrimary: Color(0xffacc7ff),
      primaryFixed: Color(0xff2c497a),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff113262),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff6f3c0b),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff512800),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff005440),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff003a2c),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb8b8bf),
      surfaceBright: Color(0xfff9f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff0f0f7),
      surfaceContainer: Color(0xffe2e2e9),
      surfaceContainerHigh: Color(0xffd4d4db),
      surfaceContainerHighest: Color(0xffc6c6cd),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffacc7ff),
      surfaceTint: Color(0xffacc7ff),
      onPrimary: Color(0xff0e2f60),
      primaryContainer: Color(0xff2a4678),
      onPrimaryContainer: Color(0xffd7e2ff),
      secondary: Color(0xffffb77f),
      onSecondary: Color(0xff4e2600),
      secondaryContainer: Color(0xff6c3a08),
      onSecondaryContainer: Color(0xffffdcc4),
      tertiary: Color(0xff88d6ba),
      onTertiary: Color(0xff00382a),
      tertiaryContainer: Color(0xff00513e),
      onTertiaryContainer: Color(0xffa4f2d5),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff111318),
      onSurface: Color(0xffe2e2e9),
      onSurfaceVariant: Color(0xffc4c6d0),
      outline: Color(0xff8e9099),
      outlineVariant: Color(0xff44474e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe2e2e9),
      inversePrimary: Color(0xff435e91),
      primaryFixed: Color(0xffd7e2ff),
      onPrimaryFixed: Color(0xff001a40),
      primaryFixedDim: Color(0xffacc7ff),
      onPrimaryFixedVariant: Color(0xff2a4678),
      secondaryFixed: Color(0xffffdcc4),
      onSecondaryFixed: Color(0xff2f1500),
      secondaryFixedDim: Color(0xffffb77f),
      onSecondaryFixedVariant: Color(0xff6c3a08),
      tertiaryFixed: Color(0xffa4f2d5),
      onTertiaryFixed: Color(0xff002117),
      tertiaryFixedDim: Color(0xff88d6ba),
      onTertiaryFixedVariant: Color(0xff00513e),
      surfaceDim: Color(0xff111318),
      surfaceBright: Color(0xff37393e),
      surfaceContainerLowest: Color(0xff0c0e13),
      surfaceContainerLow: Color(0xff1a1b20),
      surfaceContainer: Color(0xff1e2025),
      surfaceContainerHigh: Color(0xff282a2f),
      surfaceContainerHighest: Color(0xff33353a),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffcedcff),
      surfaceTint: Color(0xffacc7ff),
      onPrimary: Color(0xff002453),
      primaryContainer: Color(0xff7691c7),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffffd4b6),
      onSecondary: Color(0xff3e1d00),
      secondaryContainer: Color(0xffc4824c),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xff9eeccf),
      onTertiary: Color(0xff002c20),
      tertiaryContainer: Color(0xff529f85),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff111318),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffdadce6),
      outline: Color(0xffb0b1bb),
      outlineVariant: Color(0xff8e9099),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe2e2e9),
      inversePrimary: Color(0xff2b4779),
      primaryFixed: Color(0xffd7e2ff),
      onPrimaryFixed: Color(0xff00102c),
      primaryFixedDim: Color(0xffacc7ff),
      onPrimaryFixedVariant: Color(0xff163566),
      secondaryFixed: Color(0xffffdcc4),
      onSecondaryFixed: Color(0xff200c00),
      secondaryFixedDim: Color(0xffffb77f),
      onSecondaryFixedVariant: Color(0xff562b00),
      tertiaryFixed: Color(0xffa4f2d5),
      onTertiaryFixed: Color(0xff00150e),
      tertiaryFixedDim: Color(0xff88d6ba),
      onTertiaryFixedVariant: Color(0xff003e2f),
      surfaceDim: Color(0xff111318),
      surfaceBright: Color(0xff43444a),
      surfaceContainerLowest: Color(0xff06070c),
      surfaceContainerLow: Color(0xff1c1d22),
      surfaceContainer: Color(0xff26282d),
      surfaceContainerHigh: Color(0xff313238),
      surfaceContainerHighest: Color(0xff3c3d43),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffebf0ff),
      surfaceTint: Color(0xffacc7ff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffa7c3fc),
      onPrimaryContainer: Color(0xff000b21),
      secondary: Color(0xffffede1),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xfffdb278),
      onSecondaryContainer: Color(0xff170700),
      tertiary: Color(0xffb6ffe3),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff84d2b6),
      onTertiaryContainer: Color(0xff000e09),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff111318),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffeeeff9),
      outlineVariant: Color(0xffc0c2cc),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe2e2e9),
      inversePrimary: Color(0xff2b4779),
      primaryFixed: Color(0xffd7e2ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffacc7ff),
      onPrimaryFixedVariant: Color(0xff00102c),
      secondaryFixed: Color(0xffffdcc4),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffffb77f),
      onSecondaryFixedVariant: Color(0xff200c00),
      tertiaryFixed: Color(0xffa4f2d5),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xff88d6ba),
      onTertiaryFixedVariant: Color(0xff00150e),
      surfaceDim: Color(0xff111318),
      surfaceBright: Color(0xff4e5056),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1e2025),
      surfaceContainer: Color(0xff2e3036),
      surfaceContainerHigh: Color(0xff3a3b41),
      surfaceContainerHighest: Color(0xff45474c),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
  );

  List<ExtendedColor> get extendedColors => [];
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
