import 'package:flutter/material.dart';

import '../tokens/wall_colors.dart';
import '../tokens/wall_typography.dart';

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: WallColors.primaryColor400,
  primarySwatch: WallColors.materialColor,
  scaffoldBackgroundColor: WallColors.neutral900,
  errorColor: WallColors.error700,
  appBarTheme: const AppBarTheme(
    backgroundColor: WallColors.neutral800,
    iconTheme: IconThemeData(
      color: WallColors.primaryColor400,
    ),
    actionsIconTheme: IconThemeData(
      color: WallColors.primaryColor400,
    ),
  ),
  toggleableActiveColor: WallColors.primaryColor400,
  cardColor: WallColors.neutral800,
  textTheme: TextTheme(
    headline1: WallTypography.h1.copyWith(color: WallColors.neutral50),
    headline2: WallTypography.h2.copyWith(color: WallColors.neutral50),
    headline3: WallTypography.h3.copyWith(color: WallColors.neutral50),
    headline4: WallTypography.h4.copyWith(color: WallColors.neutral50),
    headline5: WallTypography.h5.copyWith(color: WallColors.neutral50),
    headline6: WallTypography.h6.copyWith(color: WallColors.neutral50),
    bodyText1: WallTypography.bodyLarge.copyWith(color: WallColors.neutral100),
    bodyText2: WallTypography.bodySmall.copyWith(color: WallColors.neutral100),
    button: WallTypography.elevatedButton.copyWith(color: WallColors.neutral50),
    caption: WallTypography.caption.copyWith(color: WallColors.neutral50),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: WallColors.primaryColor400,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      minimumSize: const Size(40, 48),
      textStyle: WallTypography.elevatedButton.copyWith(
        color: WallColors.neutral50,
      ),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: WallColors.primaryColor400,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      minimumSize: const Size(40, 48),
      textStyle: WallTypography.textButton.copyWith(color: WallColors.primaryColor400),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: WallColors.neutral800,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    hintStyle: WallTypography.bodyLarge,
    labelStyle: WallTypography.bodyLarge,
    helperStyle: WallTypography.bodySmall,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      minimumSize: const Size(40, 48),
      primary: WallColors.error100,
      side: const BorderSide(
        width: 2,
        color: WallColors.error100,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
  ),
);
