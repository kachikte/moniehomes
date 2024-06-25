import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppDecorations {

  static double borderRadiusCircular = 100;

  static OutlineInputBorder borderOutline = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(borderRadiusCircular)),
      borderSide: const BorderSide(
          color: AppColors.appWhite, width: 0.7, style: BorderStyle.solid));

  static OutlineInputBorder borderError = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(borderRadiusCircular)),
      borderSide: const BorderSide(
          color: AppColors.primaryColor, width: 0.7, style: BorderStyle.solid));

  static focusedBorder({required double width}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(width * 0.02)),
        borderSide: const BorderSide(
            color: AppColors.appWhite,
            width: 0.7,
            style: BorderStyle.solid));
  }

}