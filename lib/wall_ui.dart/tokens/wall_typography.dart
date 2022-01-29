import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WallTypography {
  static TextStyle h1 = GoogleFonts.shadowsIntoLight(fontSize: 72, height: 1.3);
  static TextStyle h2 = GoogleFonts.openSans(fontSize: 48, height: 1.3);
  static TextStyle h3 = GoogleFonts.shadowsIntoLight(fontSize: 36, height: 1.3);
  static TextStyle h4 = GoogleFonts.openSans(fontSize: 32, height: 1.3);
  static TextStyle h5 = GoogleFonts.shadowsIntoLight(fontSize: 24, height: 1.3);
  static TextStyle h6 = GoogleFonts.openSans(fontSize: 18, height: 1.3);

  static TextStyle bodyLarge = GoogleFonts.openSans(fontSize: 16, height: 1.5);
  static TextStyle bodySmall = GoogleFonts.openSans(fontSize: 14, height: 1.5);

  static TextStyle caption =
      GoogleFonts.openSans(fontSize: 12, height: 1.6, fontWeight: FontWeight.w600);

  static TextStyle elevatedButton =
      GoogleFonts.openSans(fontSize: 16, height: 1.5, fontWeight: FontWeight.w600);

  static TextStyle textButton = GoogleFonts.openSans(
    fontSize: 16,
    height: 1.5,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.underline,
  );
}
