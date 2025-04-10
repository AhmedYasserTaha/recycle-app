import 'package:flutter/material.dart';
import 'package:recycle_app/core/service/style.dart';

class AppBarPrfiole extends StatelessWidget {
  const AppBarPrfiole({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("assets/images/wave.png", height: 30, width: 30),
        SizedBox(width: 10),
        Text("Hello , ", style: Styles.textStyle25),
        Text("Ahmed ", style: Styles.textStyle25.copyWith(color: Colors.green)),
        const Spacer(),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),

          child: Image.asset(
            "assets/images/boy.jpg",
            fit: BoxFit.cover,
            height: 70,
            width: 70,
          ),
        ),
      ],
    );
  }
}
