// widget/text_section_widget.dart

import 'package:flutter/material.dart';
import 'package:recycle_app/core/utils/style.dart';
import 'package:recycle_app/features/uplode_item/widget/text_field_widget.dart';

class TextSectionWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Icon prefixIcon;
  final String hintText;

  const TextSectionWidget({
    super.key,
    required this.label,
    required this.controller,
    required this.prefixIcon,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(textAlign: TextAlign.center, label, style: Styles.textStyle20),
        const SizedBox(height: 10),
        TextfieldWidget(
          controller: controller,
          hintText: hintText,
          prefixIcon: prefixIcon,
        ),
      ],
    );
  }
}
