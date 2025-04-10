import 'package:flutter/material.dart';
import 'package:recycle_app/core/service/style.dart';

class PendingRequsetWidget extends StatelessWidget {
  const PendingRequsetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Icon(Icons.location_on, size: 35, color: Colors.green),
              const SizedBox(width: 10),
              const Text("Mian Market,Simpoo", style: Styles.textStyle20),
            ],
          ),
          const Divider(thickness: 3),
          const SizedBox(height: 20),

          Image.asset(
            'assets/images/chips.png',
            height: 150,
            width: 150,
            fit: BoxFit.fill,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.layers, size: 35, color: Colors.green),
              const SizedBox(width: 10),

              Text("3", style: Styles.textStyle25),
            ],
          ),
        ],
      ),
    );
  }
}
