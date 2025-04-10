import 'package:flutter/material.dart';

class AppStyles {
  static TextStyle headLineTextStyle(double size) {
    return TextStyle(
      color: Colors.black,
      fontSize: size,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle normalLineTextStyle(double size) {
    return TextStyle(
      color: Colors.black,
      fontSize: size,
      fontWeight: FontWeight.w500,
    );
  }
}
