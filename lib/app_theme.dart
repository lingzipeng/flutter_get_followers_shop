import 'package:flutter/material.dart';

import 'constants/color_constants.dart';

class Themes {
  static final lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: AppColors.spaceCadet,
      onPrimary: Colors.black,
      secondary: AppColors.spaceBlue,
      onSecondary: AppColors.spaceCadet,
      background: AppColors.blue,
    ),
  );

  static final darkTheme = ThemeData(
      colorScheme: const ColorScheme.dark(
        primary: AppColors.spaceBlue,
        secondary: AppColors.burgundy,
        onSecondary: AppColors.spaceCadet,
        background: AppColors.spaceCadet,
      ));
}