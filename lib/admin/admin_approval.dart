import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recycle_app/admin/widget/details_user_widget.dart';
import 'package:recycle_app/core/service/database.dart';
import 'package:recycle_app/core/utils/style.dart';

class AdminApproval extends StatefulWidget {
  const AdminApproval({super.key});

  @override
  State<AdminApproval> createState() => _AdminApprovalState();
}

class _AdminApprovalState extends State<AdminApproval> {
  Stream? approvalStream;

  getOnTheLoad() async {
    approvalStream = await DatabaseMehtods().getAdminApproval();
    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }

  Future<String> getUserpoints(String docId) async {
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
        title: Text("Admin Approval", style: Styles.textStyle25),
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
              child: allProvals(), // ✅ عرض البيانات هنا
            ),
          ),
        ],
      ),
    );
  }

  Widget allProvals() {
    return StreamBuilder(
      stream: approvalStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data.docs[index];
                return Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black, width: 2),
                            ),
                            child: Image.asset(
                              "assets/images/coca.png",
                              width: 120,
                              height: 120,
                            ),
                          ),
                          SizedBox(width: 10),
                          DetailsUserWidget(ds: ds),
                        ],
                      ),
                      SizedBox(height: 10),
                      approverMethod(ds),
                    ],
                  ),
                );
              },
            )
            : Center(child: CircularProgressIndicator());
      },
    );
  }

  Center approverMethod(DocumentSnapshot<Object?> ds) {
    return Center(
      child: InkWell(
        onTap: () async {
          String userPoints = await getUserpoints(ds['UserId']);
          int updatePoints = int.parse(userPoints) + 100;
          await DatabaseMehtods().updateUserPoints(
            ds['UserId'],
            updatePoints.toString(),
          );
          await DatabaseMehtods().updateAdminRequest(ds.id);
          await DatabaseMehtods().updateUserRequest(ds["UserId"], ds.id);
        },
        child: Container(
          width: 150,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              "Approve",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
