import 'package:flutter/material.dart';
import 'package:recycle_app/core/utils/style.dart';
import 'package:recycle_app/features/auth/login/widget/botton_login_widget.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/login.png",
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Image.asset(
                "assets/images/recycle1.png",
                height: 100,
                width: 100,
              ),
              const SizedBox(height: 10),
              Text(
                "Reduce. Reuse. Recycle.",
                style: Styles.textStyle25,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "Repeat!",
                style: Styles.textStyle25.copyWith(color: Colors.green),
              ),
              const SizedBox(height: 30),
              Text(
                "Every item you recycle\nmakes a difference!",
                style: Styles.textStyle20,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Text(
                "Get Started",
                style: Styles.textStyle20.copyWith(color: Colors.green),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              BottonLoginWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
