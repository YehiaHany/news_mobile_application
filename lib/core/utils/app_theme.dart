import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_styles.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: ColorScheme.light(
      primary: AppColors.black,
    ),
    appBarTheme: AppBarTheme(
        color: AppColors.white,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: AppColors.black,
        )
    ),
    textTheme: TextTheme(
      labelLarge: AppStyles.bold16Black,
      labelMedium: AppStyles.medium14Black,
      labelSmall: AppStyles.medium12Gray, // Swapped gray for black for consistency
      headlineMedium: AppStyles.medium24Black,
      headlineLarge: AppStyles.medium20Black,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        foregroundColor: AppColors.black,
        backgroundColor: AppColors.white,
        padding: EdgeInsets.symmetric(vertical: 16),
      ),
    ),
  );
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    colorScheme: ColorScheme.dark(
      primary: AppColors.white,
    ),
    appBarTheme: AppBarTheme(
        color: AppColors.black,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: AppColors.white,
        )
    ),
    textTheme: TextTheme(
      labelLarge: AppStyles.bold16White,
      labelMedium: AppStyles.medium14White,
      labelSmall: AppStyles.medium12Gray,
      headlineMedium: AppStyles.medium24White,
      headlineLarge: AppStyles.medium20White,
    ),    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.black,
        padding: EdgeInsets.symmetric(vertical: 16),
      ),
    ),
  );
}
