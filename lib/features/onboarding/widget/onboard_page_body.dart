import 'package:flutter/material.dart';
import 'package:recycle_app/core/service/style.dart';
import 'package:recycle_app/features/onboarding/widget/botton_widget.dart';

class OnBoaridPageBody extends StatelessWidget {
  const OnBoaridPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),

        Image.asset("assets/images/onboard.png"),
        SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Recycle your waste products!",
            style: Styles.textStyle30,
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),

          child: Text(
            textAlign: TextAlign.center,
            "Easily collect household wate and genrate less wate",
            style: Styles.textStyle25,
          ),
        ),
        Spacer(),
        BottonWidget(),
        SizedBox(height: 100),
      ],
    );
  }
}
