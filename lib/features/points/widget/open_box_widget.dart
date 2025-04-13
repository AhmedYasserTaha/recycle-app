import 'package:flutter/material.dart';

class OpenBox extends StatelessWidget {
  final TextEditingController pointsController;
  final TextEditingController upiController;
  final VoidCallback onAdd;

  const OpenBox({
    super.key,
    required this.pointsController,
    required this.upiController,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // زر الإغلاق
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.close, size: 24),
            ),
          ),

          const SizedBox(height: 10),

          // العنوان
          const Text(
            "Redeem Points",
            style: TextStyle(
              color: Colors.green,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          // حقل النقاط
          const Align(
            alignment: Alignment.centerLeft,
            child: Text("Add Points"),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: pointsController,
            decoration: InputDecoration(
              hintText: "Enter Points",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            keyboardType: TextInputType.number,
          ),

          const SizedBox(height: 20),

          // حقل UPI
          const Align(
            alignment: Alignment.centerLeft,
            child: Text("Add UPI Id"),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: upiController,
            decoration: InputDecoration(
              hintText: "Enter UPI",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          const SizedBox(height: 30),

          // زر Add
          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                if (pointsController.text != '' && upiController.text != "") {}
              },
              child: const Text("Add"),
            ),
          ),
        ],
      ),
    );
  }
}
