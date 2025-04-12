import 'package:flutter/material.dart';

class CameraIconWidget extends StatelessWidget {
  const CameraIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black45, width: 2),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Icon(Icons.camera_alt_rounded, size: 40),
      ),
    );
  }
}
