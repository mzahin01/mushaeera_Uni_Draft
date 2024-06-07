import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  static saveUser(String name, email, uid) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set({'email': email, 'name': name});
  }
}

class HomeController extends GetxController {
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
      return;
    }
    final data = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();
    username.value = data.data()?['name'];
  }

  void register() {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: emailController.text,
      password: passController.text,
    )
        .then(
      (UserCredential cred) {
        FirestoreServices.saveUser(
          nameController.text,
          emailController.text,
          cred.user?.uid,
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
      // Get.offAllNamed(Routes.HOME);
      Get.snackbar('Contugralations!', 'Wellcome');
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
}
