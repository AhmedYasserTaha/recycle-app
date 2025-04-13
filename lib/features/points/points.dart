import 'package:flutter/material.dart';
import 'package:recycle_app/core/service/style.dart';

class Points extends StatelessWidget {
  const Points({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Points Page", style: Styles.textStyle25),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 213, 213, 249),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(),
            ),
          ),
        ],
      ),
    );
  }
}
