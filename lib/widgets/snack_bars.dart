import 'package:flutter/material.dart';

class CustomSnackBars {
  static SnackBar signup({required String content}) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: const TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }
}
