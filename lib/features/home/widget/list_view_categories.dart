import 'package:flutter/material.dart';
import 'package:recycle_app/core/service/style.dart';
import 'package:recycle_app/features/uplode_item/uplode_item.dart';
import 'package:recycle_app/features/uplode_item/widget/uplode_item_body.dart';

class ListViewCategoreis extends StatefulWidget {
  const ListViewCategoreis({super.key});

  @override
  State<ListViewCategoreis> createState() => _ListViewCategoreisState();
}

class _ListViewCategoreisState extends State<ListViewCategoreis> {
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
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UplodeItemBody(catgory: "Plastic", id: ""),
            ),
          );
        },
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
      ),
    );
  }
}
