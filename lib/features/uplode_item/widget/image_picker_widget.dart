// widget/image_picker_widget.dart

import 'dart:io';
import 'package:flutter/material.dart';

class ImagePickerWidget extends StatelessWidget {
  final File? selectedImage;
  final VoidCallback onTap;

  const ImagePickerWidget({
    super.key,
    required this.selectedImage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Center(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.green, width: 2),
            ),
            child:
                selectedImage != null
                    ? ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.file(selectedImage!, fit: BoxFit.cover),
                    )
                    : const Icon(
                      Icons.camera_alt,
                      size: 50,
                      color: Colors.grey,
                    ),
          ),
        ),
      ),
    );
  }
}
