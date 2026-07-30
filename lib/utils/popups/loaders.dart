import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kit_store_start/utils/constants/colors.dart';

class TLoaders {
  TLoaders._();
  // Единый метод для отображения всех ошибок и успехов
  static void _show({
    required String message,
    required String title,
    required Color backgroundColor,
    required IconData icon,
  }) {
    Get.snackbar(
      title,
      message,
      backgroundColor: backgroundColor,
      icon: Icon(icon, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      duration: const Duration(seconds: 4),
      isDismissible: true,
      borderRadius: 12,
      margin: const EdgeInsets.all(16),
    );
  }

  // Успешное действие (вход, регистрация, создание аккаунта и т.д.)
  static void successSnackbar({
    required String message,
    required String title,
  }) {
    _show(
      message: message,
      title: title,
      backgroundColor: TColors.success,
      icon: Icons.check_circle_outline,
    );
  }

  // Ошибка (неверный пароль, неверный email и т.д.)
  static void errorSnackbar({required String message, required String title}) {
    _show(
      message: message,
      title: title,
      backgroundColor: TColors.error,
      icon: Icons.error_outline,
    );
  }

  // Предупреждение (недостаточно средств, неверный формат и т.д.)
  static void warningSnackbar({
    required String message,
    required String title,
  }) {
    _show(
      message: message,
      title: title,
      backgroundColor: TColors.warning,
      icon: Icons.warning_amber_outlined,
    );
  }
}
