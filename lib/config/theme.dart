import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = _baseTheme(_lightColorScheme);

  static ThemeData darkTheme = _baseTheme(_darkColorScheme);

  static final _darkColorScheme = const ColorScheme.light().copyWith();

  static final _lightColorScheme = const ColorScheme.dark().copyWith();

  static ThemeData _baseTheme(ColorScheme colorScheme) {
    return ThemeData(
        colorScheme: colorScheme,
        textTheme: GoogleFonts.poppinsTextTheme(
          _textTheme(colorScheme),
        ));
  }

  static TextTheme _textTheme(ColorScheme colorScheme) {
    return const TextTheme(
      headline1: null,
      headline2: null,
      headline3: null,
      headlineLarge: null,
      headline4: null,
      headline5: null,
      headline6: null,
      subtitle1: null,
      subtitle2: null,
      bodyText1: null,
      bodyText2: null,
      caption: null,
      button: null,
      labelMedium: null,
      overline: null,
    );
  }
}
