import 'package:flutter/material.dart';

import '../tokens/wall_colors.dart';
import '../tokens/wall_typography.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: WallColors.primaryColor500,
  primarySwatch: WallColors.materialColor,
  scaffoldBackgroundColor: WallColors.neutral100,
  errorColor: WallColors.error700,
  appBarTheme: const AppBarTheme(
      backgroundColor: WallColors.neutral50,
      iconTheme: IconThemeData(
        color: WallColors.primaryColor500,
      ),
      actionsIconTheme: IconThemeData(
        color: WallColors.primaryColor500,
      )),
  textTheme: TextTheme(
    headline1: WallTypography.h1.copyWith(color: WallColors.neutral900),
    headline2: WallTypography.h2.copyWith(color: WallColors.neutral900),
    headline3: WallTypography.h3.copyWith(color: WallColors.neutral900),
    headline4: WallTypography.h4.copyWith(color: WallColors.neutral900),
    headline5: WallTypography.h5.copyWith(color: WallColors.neutral900),
    headline6: WallTypography.h6.copyWith(color: WallColors.neutral900),
    bodyText1: WallTypography.bodyLarge.copyWith(color: WallColors.neutral800),
    bodyText2: WallTypography.bodySmall.copyWith(color: WallColors.neutral800),
    button: WallTypography.elevatedButton.copyWith(color: WallColors.neutral50),
    caption: WallTypography.caption.copyWith(color: WallColors.neutral50),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      minimumSize: const Size(40, 48),
      textStyle: WallTypography.elevatedButton.copyWith(
        color: WallColors.neutral50,
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      minimumSize: const Size(40, 48),
      textStyle: WallTypography.textButton,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    hintStyle: WallTypography.bodyLarge,
    labelStyle: WallTypography.bodyLarge,
    helperStyle: WallTypography.bodySmall,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: WallColors.primaryColor500,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      minimumSize: const Size(40, 48),
      primary: WallColors.error700,
      side: const BorderSide(
        width: 2,
        color: WallColors.error700,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
  ),
);
