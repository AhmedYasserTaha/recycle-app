import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMehtods {
  Future addUserInfo(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(userInfoMap);
  }

  Future addUserUplodeItem(
    Map<String, dynamic> userInfoMap,
    String id,
    String itemId,
  ) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .collection("Items")
        .doc(itemId)
        .set(userInfoMap);
  }

  Future addAdminItem(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Requests")
        .doc(id)
        .set(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getAdminApproval() async {
    return await FirebaseFirestore.instance
        .collection("Requests")
        .where("Status", isEqualTo: "Pending")
        .snapshots();
  }

  Future updateAdminRequest(String id) async {
    return await FirebaseFirestore.instance
        .collection("Requests")
        .doc(id)
        .update({"Status": "Approved"});
  }

  Future updateUserRequest(String id, String itemId) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .collection("Items")
        .doc(itemId)
        .update({"Status": "Approved"});
  }

  Future updateUserPoints(String id, String points) async {
    return await FirebaseFirestore.instance.collection("users").doc(id).update({
      "Points": points,
    });
  }
}
