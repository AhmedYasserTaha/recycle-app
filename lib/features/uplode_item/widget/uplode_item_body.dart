import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:recycle_app/core/service/style.dart';
import 'package:recycle_app/features/onboarding/widget/botton_widget.dart';
import 'package:recycle_app/features/uplode_item/widget/camera_icon_widget.dart';
import 'package:recycle_app/features/uplode_item/widget/text_field_widget.dart';

class UplodeItemBody extends StatefulWidget {
  const UplodeItemBody({super.key, required this.catgory, required this.id});
  final String catgory, id;

  @override
  State<UplodeItemBody> createState() => _UplodeItemBodyState();
}

class _UplodeItemBodyState extends State<UplodeItemBody> {
  TextEditingController addressController = new TextEditingController();
  TextEditingController quantityController = new TextEditingController();

  final ImagePicker _picker = ImagePicker();
  File? selectedImage;
  Future getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    selectedImage = File(image!.path);
    setState(() {});
  }

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
                  selectedImage != null
                      ? Container(
                        height: 150,
                        width: 150,
                        child: Image.file(selectedImage!, fit: BoxFit.cover),
                      )
                      : GestureDetector(
                        onTap: () {
                          getImage();
                        },

                        child: CameraIconWidget(),
                      ),
                  SizedBox(height: 30),

                  Text(
                    textAlign: TextAlign.center,
                    "Enter your address you want the\nitem to be picked",
                    style: Styles.textStyle20,
                  ),
                  SizedBox(height: 10),
                  TextfieldWidget(
                    controller: addressController,
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
                    controller: quantityController,
                    hintText: "Enter Quantity",
                    prefixIcon: Icon(
                      Icons.inventory,
                      color: Colors.green,
                      size: 30,
                    ),
                  ),

                  SizedBox(height: 50),

                  BottonWidget(
                    onTap: () async {
                      if (selectedImage != null &&
                          addressController.text != "" &&
                          quantityController.text != "") {
                        String itemId = randomAlphaNumeric(10);
                        Reference firebaseStorageRef = FirebaseStorage.instance
                            .ref()
                            .child("blogImage")
                            .child(itemId);
                        final UploadTask task = firebaseStorageRef.putFile(
                          selectedImage!,
                        );
                        var downloadUrl =
                            await (await task).ref.getDownloadURL();
                      }
                    },
                    data: "Upload",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
