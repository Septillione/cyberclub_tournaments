import 'package:flutter/material.dart';

class AppColors {
  // Основные цвета
  static const Color bgMain = Color(0xFF1A1A1A);
  static const Color bgSurface = Color(0xFF2A2A2A);

  // Акцентные цвета
  static const Color accentPrimary = Color(0xFF00A3FF);
  static const Color accentSecondary = Color(0xFFC738D8);

  // Цвета текста
  static const Color textPrimary = Color(0xFFEAEAEF);
  static const Color textSecondary = Color(0xFFA9A9A9);
  static const Color textDisabled = Color(0xFF606060);

  static const Color navBarLine = Color(0xFF404050);

  // Семантические цвета (статусы)
  static const Color statusSuccess = Color(0xFF28A745);
  static const Color statusWarning = Color(0xFFFFC107);
  static const Color statusError = Color(0xFFDC3545);
  static const Color statusLive = Color(0xFFDC3545); // Используем тот же, что и для ошибки
  static const Color statusArchived = Color(0xFFA9A9A9);
}