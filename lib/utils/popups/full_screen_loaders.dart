import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TFullScreenLoaders {
  TFullScreenLoaders._();

  static bool _isOpen = false;

  static void openLoadingDialog(String text) {
    if (_isOpen) return;
    _isOpen = true;
    Get.dialog(
      PopScope(
        canPop: false,
        child: Center(
          child: Container(
            
          ),
        )
        )
    );
  }
}
