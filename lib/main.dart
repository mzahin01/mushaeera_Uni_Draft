import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mushaira/firebase_options.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final a = await Firebase.initializeApp(
    name: 'name',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final b = FirebaseFirestore.instanceFor(app: a);
  final c = await b.collection('poems').get();
  print(c.docs);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mushaeera",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    ),
  );
}
