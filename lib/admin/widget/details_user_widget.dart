import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recycle_app/core/utils/style.dart';

class DetailsUserWidget extends StatelessWidget {
  const DetailsUserWidget({super.key, required this.ds});

  final DocumentSnapshot<Object?> ds;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.person, color: Colors.green, size: 30),
              SizedBox(width: 5),
              Text(ds['Name'], style: Styles.textStyle18),
            ],
          ),
          Row(
            children: [
              Icon(Icons.location_on, color: Colors.green, size: 30),
              SizedBox(width: 5),
              Text(ds['Address'], style: Styles.textStyle18),
            ],
          ),
          Row(
            children: [
              Icon(Icons.inventory, color: Colors.green, size: 30),
              SizedBox(width: 5),
              Text(ds['Quantity'], style: Styles.textStyle18),
            ],
          ),
        ],
      ),
    );
  }
}
