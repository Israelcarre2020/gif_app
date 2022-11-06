import 'package:flutter/material.dart';

import 'app_colors_theme.dart';
import 'app_text_theme.dart';

final lightTheme = ThemeData.light().copyWith(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  scaffoldBackgroundColor: AppColorsTheme.scaffold,
  primaryColor: AppColorsTheme.primary,
  secondaryHeaderColor: AppColorsTheme.secondary,
  hoverColor: AppColorsTheme.primary,
  textSelectionTheme:
      const TextSelectionThemeData(cursorColor: AppColorsTheme.primary),
  textTheme: AppTextTheme.textThemeLight,
  iconTheme: const IconThemeData(color: AppColorsTheme.primary, size: 28),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black87, size: 28),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColorsTheme.primary,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    focusColor: AppColorsTheme.primary,
    hoverColor: AppColorsTheme.primary,
  ),
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColorsTheme.primary, secondary: AppColorsTheme.secondary),
);

ThemeData getTheme(BuildContext context) => Theme.of(context);

TextTheme getTextTheme(BuildContext context) => getTheme(context).textTheme;
