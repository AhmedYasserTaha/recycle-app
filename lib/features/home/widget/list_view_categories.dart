import 'package:flutter/material.dart';
import 'package:recycle_app/core/service/shard_pref.dart';
import 'package:recycle_app/core/service/style.dart';
import 'package:recycle_app/features/uplode_item/widget/uplode_item_body.dart';

class ListViewCategoreis extends StatefulWidget {
  const ListViewCategoreis({super.key});

  @override
  State<ListViewCategoreis> createState() => _ListViewCategoreisState();
}

class _ListViewCategoreisState extends State<ListViewCategoreis> {
  String? id;

  Future<void> getHeSherdPref() async {
    id = await SharedPreferenceHelper().getUserId();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getHeSherdPref(); // نقدر نتصل بالدالة هنا بدون الحاجة لـ onTheLode
  }

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
          if (id != null) {
            // تحقق إذا كان id موجود
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UplodeItemBody(catgory: title, id: id!),
              ),
            );
          } else {
            // في حالة لو id مش موجود
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('User ID is not available')));
          }
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
