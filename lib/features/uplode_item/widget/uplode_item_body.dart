import 'package:flutter/material.dart';
import 'package:recycle_app/core/service/style.dart';
import 'package:recycle_app/features/uplode_item/widget/camera_icon_widget.dart';

class UplodeItemBody extends StatelessWidget {
  const UplodeItemBody({super.key});

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
                  Text(
                    textAlign: TextAlign.center,
                    "Enter your address you want the\nitem to be picked",
                    style: Styles.textStyle25,
                  ),
                  SizedBox(height: 20),

                  TextfieldWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextfieldWidget extends StatelessWidget {
  const TextfieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black45, width: 2),
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.location_on, size: 30, color: Colors.green),
          hintText: "Enter Address",
          hintStyle: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
