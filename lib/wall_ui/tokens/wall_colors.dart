import 'package:flutter/material.dart';

class WallColors {
  static MaterialColor materialColor = MaterialColor(0xFFEF115E, _colorCodes);

  static const primaryColor50 = Color(0xFFfde4ec);
  static const primaryColor100 = Color(0xFFfbbbcf);
  static const primaryColor200 = Color(0xFFf88eaf);
  static const primaryColor300 = Color(0xFFf5608f);
  static const primaryColor400 = Color(0xFFf23b76);
  static const primaryColor500 = Color(0xFFEF115E);
  static const primaryColor600 = Color(0xFFde0d5c);
  static const primaryColor700 = Color(0xFFc80858);
  static const primaryColor800 = Color(0xFFb30254);
  static const primaryColor900 = Color(0xFF8f004e);

  static const neutral50 = Color(0xFFF7F7F7);
  static const neutral100 = Color(0xFFEEEEEE);
  static const neutral200 = Color(0xFFE3E3E2);
  static const neutral300 = Color(0xFFD1D1D0);
  static const neutral400 = Color(0xFFACACAB);
  static const neutral500 = Color(0xFF8B8B8B);
  static const neutral600 = Color(0xFF636364);
  static const neutral700 = Color(0xFF515150);
  static const neutral800 = Color(0xFF323233);
  static const neutral900 = Color(0xFF131313);

  static const warning700 = Color(0xFFF1B91C);
  static const warning100 = Color(0xFFFBF7C1);

  static const error700 = Color(0xFFEF3211);
  static const error100 = Color(0xFFFFC9BA);

  static const success700 = Color(0xFF00BB5B);
  static const success100 = Color(0xFFB8F8D7);
}

Map<int, Color> _colorCodes = {
  50: WallColors.primaryColor50,
  100: WallColors.primaryColor100,
  200: WallColors.primaryColor200,
  300: WallColors.primaryColor300,
  400: WallColors.primaryColor400,
  500: WallColors.primaryColor500,
  600: WallColors.primaryColor600,
  700: WallColors.primaryColor700,
  800: WallColors.primaryColor800,
  900: WallColors.primaryColor900,
};
