import 'package:flutter/material.dart';
import 'package:json_placeholder/core/extensions/widget_extension.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator().center();
  }
}
