import 'package:flutter/material.dart';
import 'package:moniehomes/src/config/config.dart';

class AppTheme {
  static ThemeData darkTheme() {
    return ThemeData(
        primaryColor: AppColors.primaryColor,
        buttonTheme: const ButtonThemeData(
          buttonColor: AppColors.primaryColor,
        ),
        textTheme: const TextTheme(
            bodySmall: TextStyle(fontSize: 12, color: AppColors.appText),
            headlineLarge: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.appText)));
  }

  static ThemeData lightTheme() {
    return ThemeData(
        primaryColor: AppColors.primaryColor,
        // fontFamily: 'NunitoSans',
        textTheme: const TextTheme(
            bodyLarge: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w500,
                color: AppColors.appBlack),
            bodyMedium: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColors.appText),
            bodySmall: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.appText),
            headlineLarge: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: AppColors.appText)));
  }
}
