import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mushaira/app/modules/home/model/poem_model.dart';

class EditorPageController extends GetxController {
  Rx<Poem?> poem = Rx(null);
  Rx<Poem?> poemrc = Rx(null);

  @override
  void onInit() {
    super.onInit();
    poemrc.value = Get.arguments as Poem?;
    loadPoem();
  }

  loadPoem() {
    poemNameController.text =
        poemrc.value!.poemName!.words!.map((word) => word.local).join(' ');
    poemNameLatinController.text = poemrc.value!.poemName!.words!
        .map((word) => word.latinTranslitaration)
        .join(' ');
    controller3.text = poemrc.value!.poetName ?? '';
    controller4.text = poemrc.value!.recitationLinks!.join(' ');
    controller7.text = poemrc.value!.tags!.join(' ');
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
  Future<void> gamEndSet() async {
    await FirebaseFirestore.instance.collection('poems').doc('00001').set(
          poemrc.value?.toJson() ?? {},
        );
  }
}
