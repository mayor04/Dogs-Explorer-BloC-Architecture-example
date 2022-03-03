import 'package:dog_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = _baseTheme(_lightColorScheme);

  static ThemeData darkTheme = _baseTheme(_darkColorScheme);

  static final _darkColorScheme = const ColorScheme.dark().copyWith(
      //scaffold background color is also background
      );

  static final _lightColorScheme = const ColorScheme.light().copyWith(
    primary: AppColors.primary,
  );

  static ThemeData _baseTheme(ColorScheme colorScheme) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: GoogleFonts.poppinsTextTheme(
        _textTheme(colorScheme),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.dividerColor,
        thickness: 1,
        endIndent: 0,
        indent: 0,
        space: 1,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.iconColor,
        size: 28,
      ),
      cardTheme: CardTheme(
        clipBehavior: Clip.hardEdge,
        elevation: 7,
        shadowColor: AppColors.shadowColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          maximumSize: const Size.fromHeight(46),
          textStyle: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }

  //TODO: implement for dark mode
  static TextTheme _textTheme(ColorScheme colorScheme) {
    return const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w300,
        color: AppColors.bodyMedium,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.bodyMedium,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.shadowColor,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: AppColors.labelSmall,
      ),
    );
  }
}

extension ResponsiveColor on ColorScheme {
  Color get descriptionColor {
    return AppColors.labelSmall;
  }
}
