import 'package:flutter/material.dart';
import 'package:recycle_app/core/service/auth.dart';
import 'package:recycle_app/core/utils/style.dart';

class BottonLoginWidget extends StatelessWidget {
  const BottonLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: GestureDetector(
        onTap: () {
          Auth().signInWithGoogle(context);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(0.4),
                offset: Offset(0, 5),
                blurRadius: 10,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
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
                "Sign in with Google", // صححت كلمة Google
                style: Styles.textStyle25.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
