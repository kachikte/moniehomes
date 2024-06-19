import 'package:flutter/material.dart';
import 'package:moniehomes/src/config/config.dart';
import 'package:moniehomes/src/presentation/providers/providers.dart';

class AppTheme {
  static ThemeData darkTheme() {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColors.primaryColor,
      ),
      textTheme: const TextTheme(
        bodySmall: TextStyle(
          fontSize: 12,
          color: AppColors.introTextColor
        ),
        headlineLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: AppColors.introTextColor
        )
      )
    );
  }

  static ThemeData lightTheme() {
    return ThemeData(
        primaryColor: AppColors.primaryColor,
        // buttonTheme: const ButtonThemeData(
        //   buttonColor: AppColors.primaryDark,
        // ),
        textTheme: const TextTheme(
            bodySmall: TextStyle(
                fontSize: 12,
                color: AppColors.primaryColor
            ),
            headlineLarge: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: AppColors.introTextColor
            )
        )
    );
  }
}