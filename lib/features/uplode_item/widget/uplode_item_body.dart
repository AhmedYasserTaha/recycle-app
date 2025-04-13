import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:recycle_app/core/service/database.dart';
import 'package:recycle_app/core/service/shard_pref.dart';
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
  TextEditingController addressController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  String? id, name;
  bool isLoading = false; // Variable to manage loading state

  getthesharedPref() async {
    id = await SharedPreferenceHelper().getUserId();
    name = await SharedPreferenceHelper().getUserName();
    setState(() {});
  }

  Future<void> getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getthesharedPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Item", style: Styles.textStyle25),
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
                      ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 50),
                        child: Center(
                          child: Container(
                            height: 150,
                            width: 150,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.file(
                                selectedImage!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      )
                      : GestureDetector(
                        onTap: getImage,
                        child: CameraIconWidget(),
                      ),
                  SizedBox(height: 30),

                  Text(
                    textAlign: TextAlign.center,
                    "Enter your address where the item will be picked up from",
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
                    "Enter quantity of item to be picked",
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

                  bottomUploadMethod(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  BottonWidget bottomUploadMethod(BuildContext context) {
    return BottonWidget(
      onTap: () async {
        if (
        // selectedImage != null &&
        addressController.text.isNotEmpty &&
            quantityController.text.isNotEmpty) {
          setState(() {
            isLoading = true;
          });

          try {
            String itemId = randomAlphaNumeric(10);
            // Reference firebaseStorageRef = FirebaseStorage.instance
            //     .ref()
            //     .child("blogImage")
            //     .child(itemId);

            // final UploadTask task = firebaseStorageRef.putFile(selectedImage!);
            // TaskSnapshot snapshot = await task.whenComplete(() => {});
            // var downloadUrl = await snapshot.ref.getDownloadURL();

            Map<String, dynamic> addItem = {
              "Image": "downloadUrl",
              "Address": addressController.text,
              "Quantity": quantityController.text,
              "UserId": id,
              "Name": name,
              "Status": "Pending",
            };

            await DatabaseMehtods().addUserUplodeItem(addItem, id!, itemId);
            await DatabaseMehtods().addAdminItem(addItem, itemId);

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  "Item has been uploaded Successfully!",
                  style: Styles.textStyle18,
                ),
              ),
            );
            setState(() {
              addressController.text = "";
              quantityController.text = "";
              selectedImage = null;
            });
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text("Upload failed: $e", style: Styles.textStyle18),
              ),
            );
          }

          setState(() {
            isLoading = false;
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                "Please fill all fields and select an image.",
                style: Styles.textStyle18,
              ),
            ),
          );
        }
      },
      data: isLoading ? "Uploading..." : "Upload",
    );
  }
}
