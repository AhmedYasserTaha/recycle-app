import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:recycle_app/core/service/database.dart';
import 'package:recycle_app/core/service/shard_pref.dart';
import 'package:recycle_app/features/home/home_page.dart';

class Auth {
  Future<User?> signInWithGoogle(BuildContext context) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    // تسجيل دخول المستخدم
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      // المستخدم لغى العملية
      return null;
    }

    // الحصول على التوكن
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // إنشاء بيانات الاعتماد
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // تسجيل الدخول باستخدام Firebase
    final UserCredential result = await firebaseAuth.signInWithCredential(
      credential,
    );

    final User? user = result.user;

    await SharedPreferenceHelper().saveUserEmail(user!.email!);
    await SharedPreferenceHelper().saveUserId(user.uid);
    await SharedPreferenceHelper().saveUserImage(user.photoURL!);
    await SharedPreferenceHelper().saveUserName(user.displayName!);

    // لو محتاج تتعامل مع المستخدم:
    if (user != null) {
      Map<String, dynamic> userInfoMap = {
        "email": user.email,
        "name": user.displayName,
        "image": user.photoURL,
        "Id": user.uid,
        "Points": "0",
      };

      await DatabaseMehtods().addUserInfo(userInfoMap, user.uid);
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
    return null;
  }
}
