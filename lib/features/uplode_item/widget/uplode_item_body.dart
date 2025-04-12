import 'package:flutter/material.dart';
import 'package:recycle_app/core/service/style.dart';
import 'package:recycle_app/features/onboarding/widget/botton_widget.dart';
import 'package:recycle_app/features/uplode_item/widget/camera_icon_widget.dart';
import 'package:recycle_app/features/uplode_item/widget/text_field_widget.dart';

class UplodeItemBody extends StatelessWidget {
  const UplodeItemBody({super.key, required this.catgory, required this.id});
  final String catgory, id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back, size: 30),
        title: Text("Uplode Item", style: Styles.textStyle25),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 213, 213, 249),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  CameraIconWidget(),
                  SizedBox(height: 30),

                  Text(
                    textAlign: TextAlign.center,
                    "Enter your address you want the\nitem to be picked",
                    style: Styles.textStyle20,
                  ),
                  SizedBox(height: 10),
                  TextfieldWidget(
                    hintText: "Enter Address",
                    prefixIcon: Icon(
                      Icons.location_on,
                      color: Colors.green,
                      size: 30,
                    ),
                  ),
                  SizedBox(height: 30),

                  Text(
                    textAlign: TextAlign.center,
                    "Enter Quantity of item to be picked",
                    style: Styles.textStyle20,
                  ),
                  SizedBox(height: 10),
                  TextfieldWidget(
                    hintText: "Enter Quantity",
                    prefixIcon: Icon(
                      Icons.inventory,
                      color: Colors.green,
                      size: 30,
                    ),
                  ),

                  SizedBox(height: 50),

                  BottonWidget(onTap: () {}, data: "Upload"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
