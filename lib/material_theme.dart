import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4282804017),
      surfaceTint: Color(4282804017),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4291227305),
      onPrimaryContainer: Color(4278788352),
      secondary: Color(4283851339),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4292470730),
      onSecondaryContainer: Color(4279508493),
      tertiary: Color(4281886310),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4290505707),
      onTertiaryContainer: Color(4278198304),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      background: Color(4294507248),
      onBackground: Color(4279835926),
      surface: Color(4294507248),
      onSurface: Color(4279835926),
      surfaceVariant: Color(4292928726),
      onSurfaceVariant: Color(4282599486),
      outline: Color(4285823341),
      outlineVariant: Color(4291086523),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281217323),
      inverseOnSurface: Color(4293980903),
      inversePrimary: Color(4289450640),
      primaryFixed: Color(4291227305),
      onPrimaryFixed: Color(4278788352),
      primaryFixedDim: Color(4289450640),
      onPrimaryFixedVariant: Color(4281290523),
      secondaryFixed: Color(4292470730),
      onSecondaryFixed: Color(4279508493),
      secondaryFixedDim: Color(4290628527),
      onSecondaryFixedVariant: Color(4282272309),
      tertiaryFixed: Color(4290505707),
      onTertiaryFixed: Color(4278198304),
      tertiaryFixedDim: Color(4288729039),
      onTertiaryFixedVariant: Color(4280176206),
      surfaceDim: Color(4292467665),
      surfaceBright: Color(4294507248),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294178282),
      surfaceContainer: Color(4293783524),
      surfaceContainerHigh: Color(4293388767),
      surfaceContainerHighest: Color(4292994265),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4281027351),
      surfaceTint: Color(4282804017),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4284186181),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4282009137),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4285299040),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4279847498),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283399292),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      background: Color(4294507248),
      onBackground: Color(4279835926),
      surface: Color(4294507248),
      onSurface: Color(4279835926),
      surfaceVariant: Color(4292928726),
      onSurfaceVariant: Color(4282336314),
      outline: Color(4284244310),
      outlineVariant: Color(4286020721),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281217323),
      inverseOnSurface: Color(4293980903),
      inversePrimary: Color(4289450640),
      primaryFixed: Color(4284186181),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4282606894),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4285299040),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4283654217),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4283399292),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4281688931),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292467665),
      surfaceBright: Color(4294507248),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294178282),
      surfaceContainer: Color(4293783524),
      surfaceContainerHigh: Color(4293388767),
      surfaceContainerHighest: Color(4292994265),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4279052288),
      surfaceTint: Color(4282804017),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4281027351),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4279903507),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282009137),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278200103),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4279847498),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      background: Color(4294507248),
      onBackground: Color(4279835926),
      surface: Color(4294507248),
      onSurface: Color(4278190080),
      surfaceVariant: Color(4292928726),
      onSurfaceVariant: Color(4280362268),
      outline: Color(4282336314),
      outlineVariant: Color(4282336314),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281217323),
      inverseOnSurface: Color(4294967295),
      inversePrimary: Color(4291885234),
      primaryFixed: Color(4281027351),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4279579651),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282009137),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4280627229),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4279847498),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278203187),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292467665),
      surfaceBright: Color(4294507248),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294178282),
      surfaceContainer: Color(4293783524),
      surfaceContainerHigh: Color(4293388767),
      surfaceContainerHighest: Color(4292994265),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4289450640),
      surfaceTint: Color(4289450640),
      onPrimary: Color(4279842566),
      primaryContainer: Color(4281290523),
      onPrimaryContainer: Color(4291227305),
      secondary: Color(4290628527),
      onSecondary: Color(4280824864),
      secondaryContainer: Color(4282272309),
      onSecondaryContainer: Color(4292470730),
      tertiary: Color(4288729039),
      onTertiary: Color(4278204215),
      tertiaryContainer: Color(4280176206),
      onTertiaryContainer: Color(4290505707),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      background: Color(4279309326),
      onBackground: Color(4292994265),
      surface: Color(4279309326),
      onSurface: Color(4292994265),
      surfaceVariant: Color(4282599486),
      onSurfaceVariant: Color(4291086523),
      outline: Color(4287533702),
      outlineVariant: Color(4282599486),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292994265),
      inverseOnSurface: Color(4281217323),
      inversePrimary: Color(4282804017),
      primaryFixed: Color(4291227305),
      onPrimaryFixed: Color(4278788352),
      primaryFixedDim: Color(4289450640),
      onPrimaryFixedVariant: Color(4281290523),
      secondaryFixed: Color(4292470730),
      onSecondaryFixed: Color(4279508493),
      secondaryFixedDim: Color(4290628527),
      onSecondaryFixedVariant: Color(4282272309),
      tertiaryFixed: Color(4290505707),
      onTertiaryFixed: Color(4278198304),
      tertiaryFixedDim: Color(4288729039),
      onTertiaryFixedVariant: Color(4280176206),
      surfaceDim: Color(4279309326),
      surfaceBright: Color(4281809459),
      surfaceContainerLowest: Color(4278980361),
      surfaceContainerLow: Color(4279835926),
      surfaceContainer: Color(4280099098),
      surfaceContainerHigh: Color(4280822564),
      surfaceContainerHighest: Color(4281546287),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4289713811),
      surfaceTint: Color(4289450640),
      onPrimary: Color(4278655744),
      primaryContainer: Color(4286028638),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4290891699),
      onSecondary: Color(4279113992),
      secondaryContainer: Color(4287141243),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4288992211),
      onTertiary: Color(4278196762),
      tertiaryContainer: Color(4285241753),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      background: Color(4279309326),
      onBackground: Color(4292994265),
      surface: Color(4279309326),
      onSurface: Color(4294638833),
      surfaceVariant: Color(4282599486),
      onSurfaceVariant: Color(4291349695),
      outline: Color(4288718232),
      outlineVariant: Color(4286612857),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292994265),
      inverseOnSurface: Color(4280822564),
      inversePrimary: Color(4281356316),
      primaryFixed: Color(4291227305),
      onPrimaryFixed: Color(4278523136),
      primaryFixedDim: Color(4289450640),
      onPrimaryFixedVariant: Color(4280171787),
      secondaryFixed: Color(4292470730),
      onSecondaryFixed: Color(4278785028),
      secondaryFixedDim: Color(4290628527),
      onSecondaryFixedVariant: Color(4281219621),
      tertiaryFixed: Color(4290505707),
      onTertiaryFixed: Color(4278195220),
      tertiaryFixedDim: Color(4288729039),
      onTertiaryFixedVariant: Color(4278664509),
      surfaceDim: Color(4279309326),
      surfaceBright: Color(4281809459),
      surfaceContainerLowest: Color(4278980361),
      surfaceContainerLow: Color(4279835926),
      surfaceContainer: Color(4280099098),
      surfaceContainerHigh: Color(4280822564),
      surfaceContainerHighest: Color(4281546287),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294180836),
      surfaceTint: Color(4289450640),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4289713811),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294180836),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4290891699),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4293591038),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4288992211),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      background: Color(4279309326),
      onBackground: Color(4292994265),
      surface: Color(4279309326),
      onSurface: Color(4294967295),
      surfaceVariant: Color(4282599486),
      onSurfaceVariant: Color(4294508014),
      outline: Color(4291349695),
      outlineVariant: Color(4291349695),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292994265),
      inverseOnSurface: Color(4278190080),
      inversePrimary: Color(4279382273),
      primaryFixed: Color(4291556269),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4289713811),
      onPrimaryFixedVariant: Color(4278655744),
      secondaryFixed: Color(4292734158),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4290891699),
      onSecondaryFixedVariant: Color(4279113992),
      tertiaryFixed: Color(4290834671),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4288992211),
      onTertiaryFixedVariant: Color(4278196762),
      surfaceDim: Color(4279309326),
      surfaceBright: Color(4281809459),
      surfaceContainerLowest: Color(4278980361),
      surfaceContainerLow: Color(4279835926),
      surfaceContainer: Color(4280099098),
      surfaceContainerHigh: Color(4280822564),
      surfaceContainerHighest: Color(4281546287),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
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