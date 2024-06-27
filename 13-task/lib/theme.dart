import 'package:flutter/material.dart';
import 'package:new_task13/colorUI.dart';

extension CustomThemeData on ThemeData {
  Color get customContainerColor => extension<CustomColors>()!.formsContainerColor!;
  Color get customContainerColor2 => extension<CustomColors>()!.schemeContainerColor!;
  Color get customElevationButtonColor => extension<CustomColors>()!.buttonColor!;
  Color get customElevationButtonTitleColor => extension<CustomColors>()!.buttonColorTitle!;
}

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  final Color? formsContainerColor;
  final Color? schemeContainerColor;
  final Color? buttonColor;
  final Color? buttonColorTitle;

  const CustomColors({
    required this.formsContainerColor,
    required this.schemeContainerColor,
    required this.buttonColor,
    required this.buttonColorTitle,
  });

  @override
  CustomColors copyWith({
    Color? formsContainerColor,
    Color? schemeContainerColor,
    Color? buttonColor,
    Color? buttonColorTitle,
  }) {
    return CustomColors(
      formsContainerColor: formsContainerColor ?? this.formsContainerColor,
      schemeContainerColor: schemeContainerColor ?? this.schemeContainerColor,
      buttonColor: buttonColor ?? this.buttonColor,
      buttonColorTitle: buttonColorTitle ?? this.buttonColorTitle,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      formsContainerColor: Color.lerp(formsContainerColor, other.formsContainerColor, t),
      schemeContainerColor: Color.lerp(schemeContainerColor, other.schemeContainerColor, t),
      buttonColor: Color.lerp(buttonColor, other.buttonColor, t),
      buttonColorTitle: Color.lerp(buttonColorTitle, other.buttonColorTitle, t),
    );
  }
}



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
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: AppColorsDark.colorTitleMokInContainerDark,
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
        return AppColors.colorRadioButtonActiveGreen;
      }
      return Colors.black;
    }),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.colorAppBarDecorationGreen,
    ),
  ),
  elevatedButtonTheme:  ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 16),
    backgroundColor: AppColorsLight.bgColorButtonLogOutLightGreen,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),),),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: AppColors.colorTitleMyMedalsGreen,
      fontSize: 14,
    ),
    bodyMedium: TextStyle(
      color: AppColorsLight.colorTitleMokInContainerLightGreen,
    ),
  ),
  iconTheme: const IconThemeData(color: AppColors.colorAppBarDecorationGreen),
  extensions: <ThemeExtension<dynamic>>[
    const CustomColors(
        formsContainerColor: AppColorsLight.colorFormsContainerLightGreen,
        schemeContainerColor: AppColorsLight.bgColorContainerInModalBottomSheetLightGreen,
        buttonColor: AppColors.colorAppBarDecorationGreen,
        buttonColorTitle: AppColorsLight.colorTitlesModalBottomSheetLight,),
  ],
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
        return AppColors.colorRadioButtonActiveBlue;
      }
      return Colors.black;
    }),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.colorAppBarDecorationBlue,
    ),
  ),
  elevatedButtonTheme:  ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 16),
      backgroundColor: AppColorsLight.bgColorButtonLogOutLightBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),),),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: AppColors.colorTitleMyMedalsBlue,
      fontSize: 14,
    ),
    bodyMedium: TextStyle(
      color: AppColorsLight.colorTitleMokInContainerLightBlue,
    ),
  ),
  iconTheme: const IconThemeData(color: AppColors.colorAppBarDecorationBlue),
  extensions: <ThemeExtension<dynamic>>[
    const CustomColors(
        formsContainerColor: AppColorsLight.colorFormsContainerLightBlue,
        schemeContainerColor: AppColorsLight.bgColorContainerInModalBottomSheetLightBlue,
        buttonColor: AppColors.colorAppBarDecorationBlue,
        buttonColorTitle: AppColorsLight.colorTitlesModalBottomSheetLight,),
  ],
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
        return AppColors.colorRadioButtonActiveOrange;
      }
      return Colors.black;
    }),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.colorAppBarDecorationOrange,
    ),
  ),
  elevatedButtonTheme:  ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 16),
      backgroundColor: AppColorsLight.bgColorButtonLogOutLightOrange,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),),),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: AppColors.colorTitleMyMedalsOrange,
      fontSize: 14,
    ),
    bodyMedium: TextStyle(
      color: AppColorsLight.colorTitleMokInContainerLightOrange,
    ),
  ),
  iconTheme: const IconThemeData(color: AppColors.colorAppBarDecorationOrange),
  extensions: <ThemeExtension<dynamic>>[
    const CustomColors(
        formsContainerColor: AppColorsLight.colorFormsContainerLightOrange,
        schemeContainerColor: AppColorsLight.bgColorContainerInModalBottomSheetLightOrange,
        buttonColor: AppColors.colorAppBarDecorationOrange,
        buttonColorTitle: AppColorsLight.colorTitlesModalBottomSheetLight,),
  ],
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
        return AppColors.colorRadioButtonActiveGreen;
      }
      return Colors.white60;
    }),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.colorAppBarDecorationGreen,
    ),
  ),
  elevatedButtonTheme:  ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 16),
      backgroundColor: AppColorsDark.bgColorButtonLogOutDarkGreen,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),),),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: AppColors.colorTitleMyMedalsGreen,
      fontSize: 14,
    ),
  ),
  iconTheme: const IconThemeData(color: AppColors.colorAppBarDecorationGreen),
  extensions: <ThemeExtension<dynamic>>[
    const CustomColors(
        formsContainerColor: AppColorsDark.colorFormsContainerDarkGreen,
        schemeContainerColor: AppColorsDark.bgColorContainerInModalBottomSheetDarkGreen,
        buttonColor: AppColors.colorAppBarDecorationGreen,
        buttonColorTitle: AppColorsDark.colorTitlesModalBottomSheetDark,),
  ],
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
        return AppColors.colorRadioButtonActiveBlue;
      }
      return Colors.white60;
    }),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.colorAppBarDecorationBlue,
    ),
  ),
  elevatedButtonTheme:  ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 16),
      backgroundColor: AppColorsDark.bgColorButtonLogOutDarkBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),),),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: AppColors.colorTitleMyMedalsBlue,
      fontSize: 14,
    ),
  ),
  iconTheme: const IconThemeData(color: AppColors.colorAppBarDecorationBlue),
  extensions: <ThemeExtension<dynamic>>[
    const CustomColors(
        formsContainerColor: AppColorsDark.colorFormsContainerDarkBlue,
        schemeContainerColor: AppColorsDark.bgColorContainerInModalBottomSheetDarkBlue,
        buttonColor: AppColors.colorAppBarDecorationBlue,
        buttonColorTitle: AppColorsDark.colorTitlesModalBottomSheetDark,),
  ],
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
        return AppColors.colorRadioButtonActiveOrange;
      }
      return Colors.white60;
    }),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.colorAppBarDecorationOrange,
    ),
  ),
  elevatedButtonTheme:  ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 16),
      backgroundColor: AppColorsDark.bgColorButtonLogOutDarkOrange,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),),),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: AppColors.colorTitleMyMedalsOrange,
      fontSize: 14,
    ),
  ),
  iconTheme: const IconThemeData(color: AppColors.colorAppBarDecorationOrange),
  extensions: <ThemeExtension<dynamic>>[
    const CustomColors(
        formsContainerColor: AppColorsDark.colorFormsContainerDarkOrange,
        schemeContainerColor: AppColorsDark.bgColorContainerInModalBottomSheetDarkOrange,
        buttonColor: AppColors.colorAppBarDecorationOrange,
        buttonColorTitle: AppColorsDark.colorTitlesModalBottomSheetDark,),
  ],
);
