import 'package:flutter/material.dart';
import 'package:get/get.dart';

customSnackbar(title, message, type) {
  Get.snackbar(
    title,
    message,
    snackPosition: type == "error" ? SnackPosition.BOTTOM : SnackPosition.TOP,
    backgroundColor: type == "error" ? Colors.red : Colors.green,
    colorText: Colors.white,
    margin: const EdgeInsets.all(10),
    duration: const Duration(
      milliseconds: 1300,
    ),
  );
}
