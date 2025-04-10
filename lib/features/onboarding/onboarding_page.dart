import 'package:flutter/material.dart';
import 'package:recycle_app/features/onboarding/widget/onboard_page_body.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: OnBoaridPageBody());
  }
}
