import 'package:flutter/material.dart';
import 'package:new_task13/colorUI.dart';

const TextStyle baseTitleTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w700);

ThemeData baseLightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    titleTextStyle: baseTitleTextStyle,
  ),
);

ThemeData baseDarkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: AppColorsDark.colorAppBarColorTitleDark,
      fontSize: 18,
      fontWeight: FontWeight.w700,
    ),
  ),
);

// Светлые темы
ThemeData greenLightTheme = baseLightTheme.copyWith(
  appBarTheme: baseLightTheme.appBarTheme.copyWith(
    backgroundColor: AppColorsLight.colorAppBarBgLightGreen,
    iconTheme: const IconThemeData(color: AppColors.colorAppBarDecorationGreen),
    titleTextStyle: baseTitleTextStyle.copyWith(color: AppColorsLight.colorAppBarColorTitleLightGreen),
  ),
  scaffoldBackgroundColor: AppColorsLight.bgBodyLightGreen,
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: AppColorsLight.bgColorModalBottomSheetLightGreen,
  ),
  radioTheme: RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.colorRadioButtonActiveGreen; // Цвет для активного состояния
      }
      return Colors.black; // Цвет для неактивного состояния
    }),
  ),
);

ThemeData blueLightTheme = baseLightTheme.copyWith(
  appBarTheme: baseLightTheme.appBarTheme.copyWith(
    backgroundColor: AppColorsLight.colorAppBarBgLightBlue,
    iconTheme: const IconThemeData(color: AppColors.colorAppBarDecorationBlue),
    titleTextStyle: baseTitleTextStyle.copyWith(color: AppColorsLight.colorAppBarColorTitleLightBlue),
  ),
  scaffoldBackgroundColor: AppColorsLight.bgBodyLightBlue,
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: AppColorsLight.bgColorModalBottomSheetLightBlue,
  ),
  radioTheme: RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.colorRadioButtonActiveBlue; // Цвет для активного состояния
      }
      return Colors.black; // Цвет для неактивного состояния
    }),
  ),
);

ThemeData orangeLightTheme = baseLightTheme.copyWith(
  appBarTheme: baseLightTheme.appBarTheme.copyWith(
    backgroundColor: AppColorsLight.colorAppBarBgLightOrange,
    iconTheme: const IconThemeData(color: AppColors.colorAppBarDecorationOrange),
    titleTextStyle: baseTitleTextStyle.copyWith(color: AppColorsLight.colorAppBarColorTitleLightOrange),
  ),
  scaffoldBackgroundColor: AppColorsLight.bgBodyLightOrange,
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: AppColorsLight.bgColorModalBottomSheetLightOrange,
  ),
  radioTheme: RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.colorRadioButtonActiveOrange; // Цвет для активного состояния
      }
      return Colors.black; // Цвет для неактивного состояния
    }),
  ),
);

// Темные темы
ThemeData greenDarkTheme = baseDarkTheme.copyWith(
  appBarTheme: baseDarkTheme.appBarTheme.copyWith(
    backgroundColor: AppColorsDark.colorAppBarBgDarkGreen,
    iconTheme: const IconThemeData(color: AppColors.colorAppBarDecorationGreen),
  ),
  scaffoldBackgroundColor: AppColorsDark.bgBodyDarkGreen,
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: AppColorsDark.bgColorModalBottomSheetDarkGreen,
  ),
  radioTheme: RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.colorRadioButtonActiveGreen; // Цвет для активного состояния
      }
      return Colors.white60; // Цвет для неактивного состояния
    }),
  ),
);

ThemeData blueDarkTheme = baseDarkTheme.copyWith(
  appBarTheme: baseDarkTheme.appBarTheme.copyWith(
    backgroundColor: AppColorsDark.colorAppBarBgDarkBlue,
    iconTheme: const IconThemeData(color: AppColors.colorAppBarDecorationBlue),
  ),
  scaffoldBackgroundColor: AppColorsDark.bgBodyDarkBlue,
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: AppColorsDark.bgColorModalBottomSheetDarkBlue,
  ),
  radioTheme: RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.colorRadioButtonActiveBlue; // Цвет для активного состояния
      }
      return Colors.white60; // Цвет для неактивного состояния
    }),
  ),
);

ThemeData orangeDarkTheme = baseDarkTheme.copyWith(
  appBarTheme: baseDarkTheme.appBarTheme.copyWith(
    backgroundColor: AppColorsDark.colorAppBarBgDarkOrange,
    iconTheme: const IconThemeData(color: AppColors.colorAppBarDecorationOrange),
  ),
  scaffoldBackgroundColor: AppColorsDark.bgBodyDarkOrange,
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: AppColorsDark.bgColorModalBottomSheetDarkOrange,
  ),
  radioTheme: RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.colorRadioButtonActiveOrange; // Цвет для активного состояния
      }
      return Colors.white60; // Цвет для неактивного состояния
    }),
  ),
);
