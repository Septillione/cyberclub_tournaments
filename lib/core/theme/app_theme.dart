import 'package:cyberclub_tournaments/core/theme/app_colors.dart';
import 'package:cyberclub_tournaments/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

ThemeData buildAppTheme() {
  final baseTheme = ThemeData.dark();

  return baseTheme.copyWith(
    // splashFactory: NoSplash.splashFactory,
    // highlightColor: Colors.transparent,
    primaryColor: AppColors.accentPrimary,
    scaffoldBackgroundColor: AppColors.bgMain,
    canvasColor: AppColors.bgMain,
    cardColor: AppColors.bgSurface,

    colorScheme: baseTheme.colorScheme.copyWith(
      primary: AppColors.accentPrimary,
      secondary: AppColors.accentSecondary,
      surface: AppColors.bgSurface,
      error: AppColors.statusError,
      onPrimary: AppColors.textPrimary,
      onSecondary: AppColors.textPrimary,
      onSurface: AppColors.textPrimary,
      onError: AppColors.textPrimary,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.bgMain,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: AppTextStyles.h2,
      iconTheme: const IconThemeData(color: AppColors.textPrimary),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.bgSurface,
      selectedItemColor: AppColors.accentPrimary,
      unselectedItemColor: AppColors.textSecondary,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      selectedLabelStyle: AppTextStyles.caption,
      unselectedLabelStyle: AppTextStyles.caption,
      enableFeedback: false
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accentPrimary,
        foregroundColor: AppColors.textPrimary,
        textStyle: AppTextStyles.button,
        minimumSize: const Size.fromHeight(56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.accentPrimary,
        textStyle: AppTextStyles.button,
        minimumSize: const Size.fromHeight(48),
        side: const BorderSide(color: AppColors.accentPrimary, width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.bgSurface,
      hintStyle: AppTextStyles.bodyL.copyWith(color: AppColors.textDisabled),
      labelStyle: AppTextStyles.bodyL.copyWith(color: AppColors.textSecondary),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.accentPrimary, width: 2),
      ),
    ),
  );
}
