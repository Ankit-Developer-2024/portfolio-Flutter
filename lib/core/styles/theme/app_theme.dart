import 'package:flutter/material.dart';
import 'package:portfolio/core/styles/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    colorScheme: const ColorScheme.light().copyWith(
        onSurface: AppColors.lightBlueish, onPrimaryContainer: AppColors.white),
    drawerTheme: const DrawerThemeData().copyWith(
      backgroundColor: AppColors.lightBlueish,
    ),
    scaffoldBackgroundColor: AppColors.lightBlueish,
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
      colorScheme: const ColorScheme.dark().copyWith(
          onSurface: AppColors.darkModeColor,
          onPrimaryContainer: AppColors.mediumBlue),
      drawerTheme: const DrawerThemeData().copyWith(
        backgroundColor: AppColors.darkModeColor,
      ),
      scaffoldBackgroundColor: AppColors.darkModeColor);
}
