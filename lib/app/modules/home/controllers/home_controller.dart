import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mushaira/app/modules/home/model/userdata_model.dart';

class FirestoreServices {
  static saveUser(String name, email, uid) async {}
}

class HomeController extends GetxController {
  Rx<UserData?> userData = Rx(null);
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController logemailController = TextEditingController();
  TextEditingController logpassController = TextEditingController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Rx<User?> user = Rx(null);
  RxnString username = RxnString();

  @override
  void onInit() {
    FirebaseAuth.instance.authStateChanges().listen((User? u) {
      user.value = u;
      getUserName(u);
    });
    super.onInit();
  }

  Future<void> getUserName(User? user) async {
    if (user == null) {
      userData = Rx(null);
      return;
    }
    final DocumentSnapshot<Map<String, dynamic>> data = await FirebaseFirestore
        .instance
        .collection('users')
        .doc(user.uid)
        .get();
    final Map<String, dynamic> json = data.data() ?? {};
    userData.value = UserData.fromJson(json);
  }

  void register() {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: emailController.text,
      password: passController.text,
    )
        .then(
      (UserCredential cred) {
        userData.value = UserData(
          name: nameController.text,
          email: emailController.text,
          role: 'User',
          favouritePoemsIds: null,
        );
        saveUser(
          cred.user!.uid,
        );
        Get.back();
      },
    );
  }

  void login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: logemailController.text,
        password: logpassController.text,
      );

      Get.back();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('WEAK!', 'Password Provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('REPEAT!', 'Email Provided already Exists');
      } else if (e.code == 'invalid-credential') {
        Get.snackbar('WRONG!', 'Email and Password does not match');
      }
    } catch (e) {
      Get.snackbar('WEAK!', e.toString());
    }
  }

  Future<void> saveUser(String uid) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).set(
          userData.value?.toJson() ?? {},
        );
  }
}
