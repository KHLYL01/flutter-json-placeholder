import 'package:flutter/material.dart';
import '../constants/app_color.dart';

Widget customTextFormField({
  required String hint,
  required TextEditingController textController,
  IconData icon = Icons.title,
  FormFieldValidator? validator,
  int maxLines = 1,
  double radius = 12,
  TextInputType? keyboardType,
  bool isEnable = true,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextFormField(
        enabled: isEnable,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.start,
        maxLines: maxLines,
        minLines: 1,
        validator: validator,
        controller: textController,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          isDense: true,
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
          prefixIcon: Icon(
            icon,
            color: AppColors.mainColor,
            size: 28,
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          border: InputBorder.none,
          errorStyle: const TextStyle(fontSize: 0),
        ),
        cursorColor: AppColors.mainColor,
      ),
    ],
  );
}
