import 'package:flutter/material.dart';
import 'package:test_task16/utils/app_colors.dart';


ThemeData appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    primary: AppColors.primaryColor,
    secondary: AppColors.iconBackgroundActiveColor,
    tertiary: AppColors.textFieldColor,
    seedColor: AppColors.iconBackgroundActiveColor,
    background: AppColors.colorBackground,
    primaryContainer: AppColors.whiteColor,
    secondaryContainer: AppColors.iconBackgroundActiveColor,
    onBackground: AppColors.disabledButtonColor,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      foregroundColor: AppColors.iconBackgroundActiveColor,
    ),
  ),
  datePickerTheme: const DatePickerThemeData(
    headerBackgroundColor: AppColors.iconBackgroundActiveColor,
  ),
  fontFamily: 'Sf Pro Display',
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    titleLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    labelLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
  ),
);

