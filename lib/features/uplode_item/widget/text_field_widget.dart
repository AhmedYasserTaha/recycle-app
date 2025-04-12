import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  const TextfieldWidget({
    super.key,
    required this.hintText,
    required this.prefixIcon,
  });

  final String? hintText;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black45, width: 2),
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12, // لون الظل
            blurRadius: 6, // مدى التمويه
            offset: Offset(2, 2), // اتجاه الظل
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
