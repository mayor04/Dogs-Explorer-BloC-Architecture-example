import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFC1643C);
  static const Color secondary = Color(0xFF00A6FF);
  static const Color accent = Color(0xFF00A6FF);
  static const Color shadowColor = Color(0x40DED5D5);

  //TEXT
  static const Color bodyMedium = Color(0xFF393939);
  static const Color labelSmall = Color(0xFFC2C2C2);

  //Search bar
  static const Color searchFill = Color(0xEDF8F7F7);
  static const Color searchBorder = Color(0xFFE3E3E3);

  static const Color iconColor = Color(0xFF6F6F6F);
  static const Color dividerColor = Color(0xFFEAEAEA);

  //Shimmer
  static const Color shimmerBase = Color(0xFFE1E0E0);
  static const Color shimmerHighlight = Color(0xFFF2F2F2);
  static const Color shimmerBg = Color.fromARGB(255, 157, 157, 157);
}

class AppGradient {
  static const List<Color> appBarOverlay = [
    Color(0x8C000000),
    Color(0x7A000000),
    Color(0x4F000000),
    Color(0x14000000),
  ];
}
