import 'package:flutter/material.dart';

class TColors {
  /// -- Основные цвета приложения
  static const Color primary = Color(0xFF4b68ff);
  static const Color secondary = Color.fromARGB(255, 103, 255, 14);

  /// -- Цвета текста
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textWhite = Colors.white;
  static const Color textDisabled = Color(0xFF9CA3AF);

  /// -- Цвета фона
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF1F2937);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  /// -- Цвета границ
  static const Color borderPrimary = Color(0xFFD1D5DB);
  static const Color borderSecondary = Color(0xFFE5E7EB);

  /// -- Цвета заливок
  static const Color fillPrimary = Color(0xFFF3F4F6);
  static const Color fillSecondary = Color(0xFFE5E7EB);

  /// -- Цвета контейнеров (Карточки, блоки, секции и т.д.)
  static const Color containerBackground = Colors.white;
  static const Color containerSecondary = Color(0xFFF9FAFB);

  /// -- Цвета кнопок
  static const Color buttonPrimary = primary;
  static const Color buttonSecondary = secondary;
  static const Color buttonDisabled = Color(0xFFD1D5DB);
  static const Color buttonText = textWhite;

  /// -- Цвета индикаторов
  static const Color indicatorActive = primary;
  static const Color indicatorInactive = Color(0xFFD1D5DB);

  /// -- Цвета статусов,ошибок,успехов,предупреждений
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);
}
