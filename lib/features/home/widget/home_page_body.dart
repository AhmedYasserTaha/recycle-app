import 'package:flutter/material.dart';
import 'package:recycle_app/core/service/style.dart';
import 'package:recycle_app/features/home/widget/app_bar_profile.dart';
import 'package:recycle_app/features/home/widget/list_view_categories.dart';
import 'package:recycle_app/features/home/widget/pending_requset_widget.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppBarPrfiole(),
            const SizedBox(height: 30),
            Center(child: Image.asset("assets/images/home.png")),
            const SizedBox(height: 20),
            const Text("Categories", style: Styles.textStyle25),
            const SizedBox(height: 20),
            const ListViewCategoreis(),
            const SizedBox(height: 20),
            const Text("Pending Requset", style: Styles.textStyle25),
            const SizedBox(height: 20),
            const PendingRequsetWidget(),
          ],
        ),
      ),
    );
  }
}
