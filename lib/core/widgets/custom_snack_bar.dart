import 'package:flutter/material.dart';
import 'package:get/get.dart';

customSnackBar({
  required String title,
  required String message,
  bool isDone = true,
  bool withDuration = true,
}) {
  Get.closeCurrentSnackbar();
  return Get.showSnackbar(
    GetSnackBar(
      duration: withDuration ? const Duration(milliseconds: 1500) : null,
      title: title.tr,
      message: message.tr,
      icon: isDone
          ? const Icon(
              Icons.done_all,
              color: Colors.green,
            )
          : const Icon(
              Icons.warning_amber,
              color: Colors.red,
            ),
    ),
  );
}
