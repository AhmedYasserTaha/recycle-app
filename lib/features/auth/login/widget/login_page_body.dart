import 'package:flutter/material.dart';
import 'package:recycle_app/core/service/style.dart';
import 'package:recycle_app/features/auth/login/widget/botton_login_widget.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Image.asset(
              "assets/images/login.png",
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20),
          Image.asset("assets/images/recycle1.png", height: 120, width: 120),
          SizedBox(height: 10),
          Text("Reduce. Reuse. Recycle.", style: Styles.textStyle25),
          SizedBox(height: 10),
          Text(
            "Repeat!",
            style: Styles.textStyle25.copyWith(color: Colors.green),
          ),
          SizedBox(height: 40),
          Text(
            textAlign: TextAlign.center,
            "Every item you recycle\nmakes a difference!",
            style: Styles.textStyle20,
          ),
          SizedBox(height: 40),

          Text(
            textAlign: TextAlign.center,
            "Get Started",
            style: Styles.textStyle20.copyWith(color: Colors.green),
          ),
          BottonLoginWidget(),
        ],
      ),
    );
  }
}
