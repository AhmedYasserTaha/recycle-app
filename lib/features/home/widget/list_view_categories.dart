import 'package:flutter/material.dart';
import 'package:recycle_app/core/service/style.dart';

class ListViewCategoreis extends StatelessWidget {
  const ListViewCategoreis({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          categoryItem("assets/images/plastic.png", "Plastic"),
          categoryItem("assets/images/paper.png", "Paper"),
          categoryItem("assets/images/glass.png", "Glass"),
          categoryItem("assets/images/battery.png", "Metal"),
        ],
      ),
    );
  }

  Widget categoryItem(String imagePath, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xffececf8),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black45, width: 2),
            ),
            child: Image.asset(imagePath, height: 70, width: 70),
          ),
          const SizedBox(height: 8),
          Text(title, style: Styles.textStyle18),
        ],
      ),
    );
  }
}
