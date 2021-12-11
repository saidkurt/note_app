import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/core/const/app_color.dart';

mixin ErrorSnackbar {
  void erorSnackBar(String message, String title) {
    Get.snackbar(
      title,
      message,
      colorText: Colors.white,
      icon: const Icon(Icons.error, color: Colors.white),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.grey,
    );
  }
}
