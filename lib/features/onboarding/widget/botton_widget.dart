import 'dart:ui';

import 'package:flutter/material.dart';

class BottonWidget extends StatelessWidget {
  const BottonWidget({super.key, required this.onTap, required this.data});
  final void Function()? onTap;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                data,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
