import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mushaira/app/modules/home/model/poem_model.dart';

class EditorPageController extends GetxController {
  Rx<Poem?> poem = Rx(null);
  RxString poemUID = ''.obs;

  @override
  Future<void> onInit() async {
    poemUID.value = Get.arguments as String;
    // print(poemUID.value);
    if (poemUID.value != '') {
      await fetchPoem();
      loadPoem();
    }
    super.onInit();
  }

  Future<void> fetchPoem() async {
    DocumentSnapshot<Map<String, dynamic>> doc = await FirebaseFirestore
        .instance
        .collection('poems')
        .doc(poemUID.value)
        .get();
    Map<String, dynamic>? data = doc.data();
    poem.value = (Poem.fromJson(data!));
  }

  loadPoem() {
    poemNameController.text =
        poem.value!.poemName!.words!.map((word) => word.local).join(' ');
    poemNameLatinController.text = poem.value!.poemName!.words!
        .map((word) => word.latinTranslitaration)
        .join(' ');
    controller3.text = poem.value!.poetName ?? '';
    controller4.text = poem.value!.recitationLinks!.join(' ');
    controller7.text = poem.value!.tags!.join(' ');
  }

  final TextEditingController poemNameController =
      TextEditingController(text: '');
  final TextEditingController poemNameLatinController =
      TextEditingController(text: '');
  final TextEditingController controller3 = TextEditingController(text: '');
  final TextEditingController controller4 = TextEditingController(text: '');
  final TextEditingController controller5 = TextEditingController(text: '');
  final TextEditingController controller6 = TextEditingController(text: '');
  final TextEditingController controller7 = TextEditingController(text: '');

  Future<void> savePoem() async {
    poem.value?.poemName?.words?.first.local = poemNameController.text;
    poem.value?.poemName?.words?.first.latinTranslitaration =
        poemNameLatinController.text;
    poem.value?.poetName = controller3.text;
    poem.value!.recitationLinks = controller4.text.split(' ');
    poem.value!.tags = controller7.text.split(' ');

    await FirebaseFirestore.instance.collection('poems').doc(poemUID.value).set(
          poem.value?.toJson() ?? {},
        );
  }
}
