import 'package:flutter/material.dart';

class WallTypography {
  static TextStyle h1 = const TextStyle(fontSize: 72, height: 1.3, fontFamily: 'Shadows');
  static TextStyle h2 = const TextStyle(fontSize: 48, height: 1.3, fontWeight: FontWeight.w600);
  static TextStyle h3 = const TextStyle(fontSize: 36, height: 1.3, fontFamily: 'Shadows');
  static TextStyle h4 = const TextStyle(fontSize: 32, height: 1.3, fontWeight: FontWeight.w600);
  static TextStyle h5 = const TextStyle(fontSize: 24, height: 1.3, fontFamily: 'Shadows');
  static TextStyle h6 = const TextStyle(fontSize: 18, height: 1.3, fontWeight: FontWeight.w600);

  static TextStyle bodyLarge =
      const TextStyle(fontSize: 16, height: 1.5, fontWeight: FontWeight.w400);
  static TextStyle bodySmall =
      const TextStyle(fontSize: 14, height: 1.5, fontWeight: FontWeight.w400);

  static TextStyle caption =
      const TextStyle(fontSize: 12, height: 1.6, fontWeight: FontWeight.w600);

  static TextStyle elevatedButton =
      const TextStyle(fontSize: 16, height: 1.5, fontWeight: FontWeight.w600);

  static TextStyle textButton = const TextStyle(
    fontSize: 16,
    height: 1.5,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.underline,
  );
}
