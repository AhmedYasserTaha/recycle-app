import 'package:flutter/material.dart';
import 'package:recycle_app/core/service/style.dart';
import 'package:recycle_app/features/home/widget/app_bar_profile.dart';
import 'package:recycle_app/features/home/widget/list_view_categories.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black45, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on, color: Colors.green),
                        const SizedBox(width: 10),
                        const Text(
                          "Mian Market,Simpoo",
                          style: Styles.textStyle18,
                        ),
                      ],
                    ),
                    const Divider(thickness: 3),
                    const SizedBox(height: 20),

                    Image.asset(
                      'assets/images/chips.png',
                      height: 120,
                      width: 120,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
