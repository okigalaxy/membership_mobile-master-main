import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoMessageHelper {
  static void showMessage(String message) => Get.snackbar(
        "Message",
        message,
      );
}
