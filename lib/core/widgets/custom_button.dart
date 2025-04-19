import 'package:flutter/material.dart';

import '../constants/app_color.dart';

Widget customButton({
  required String title,
  VoidCallback? onPressed,
  double radius = 12,
  double height = 65,
  Color color = AppColors.mainColor,
}) {
  return Container(
    height: height,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
    ),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(fontSize: 26, color: Colors.white),
      ),
    ),
  );
}
