import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recycle_app/core/service/shard_pref.dart';
import 'package:recycle_app/core/utils/style.dart';
import 'package:recycle_app/features/onboarding/widget/botton_widget.dart';

class Points extends StatefulWidget {
  const Points({super.key});

  @override
  State<Points> createState() => _PointsState();
}

class _PointsState extends State<Points> {
  String? id, myPoints;
  gettheSaredPref() async {
    id = await SharedPreferenceHelper().getUserId();
    setState(() {});
  }

  onTheLoad() async {
    await gettheSaredPref();
    myPoints = await getUserpoints(id!);
    setState(() {});
  }

  Future<String> getUserpoints(String docId) async {
    TextEditingController pointsController = new TextEditingController();
    TextEditingController upiController = new TextEditingController();
    try {
      DocumentSnapshot docSnapshot =
          await FirebaseFirestore.instance.collection('users').doc(docId).get();
      if (docSnapshot.exists) {
        var data = docSnapshot.data() as Map<String, dynamic>;
        var points = data["Points"];
        return points;
      } else {
        return "No document";
      }
    } catch (e) {
      print('error : $e');
      return 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Points Page", style: Styles.textStyle25),
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
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(
                            255,
                            0,
                            0,
                            0,
                          ).withOpacity(0.3), // ✅ ظل خفيف
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 3), // اتجاه الظل
                        ),
                      ],
                    ),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          "assets/images/coin.png",
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 30),
                        Text("Points =", style: Styles.textStyle30),
                        Text(
                          "300",
                          style: Styles.textStyle30.copyWith(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  BottonWidget(onTap: () {}, data: "Reedem Points"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
