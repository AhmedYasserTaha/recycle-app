import 'package:flutter/material.dart';
import 'package:recycle_app/core/service/style.dart';

class BottonLoginWidget extends StatelessWidget {
  const BottonLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(60),
              ),
              child: Image.asset(
                "assets/images/google.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),

            Text(
              "Sign in with Googel",
              style: Styles.textStyle25.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
