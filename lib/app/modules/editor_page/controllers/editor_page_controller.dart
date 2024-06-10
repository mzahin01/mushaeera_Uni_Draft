import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mushaira/app/modules/home/model/poem_model.dart';

class EditorPageController extends GetxController {
  Rx<Poem?> poem = Rx(null);
  RxString poemUID = ''.obs;

  final TextEditingController poemNameController =
      TextEditingController(text: '');
  final TextEditingController poemNameLatinController =
      TextEditingController(text: '');
  final TextEditingController poetNameController =
      TextEditingController(text: '');
  final TextEditingController poemYTlinkController =
      TextEditingController(text: '');
  final TextEditingController poemTagsController =
      TextEditingController(text: '');

  @override
  void onInit() {
    super.onInit();
    poemUID.value = Get.arguments as String? ?? '';
    if (poemUID.value.isNotEmpty) {
      fetchPoem().then((_) => loadPoem());
    }
  }

  Future<void> fetchPoem() async {
    DocumentSnapshot<Map<String, dynamic>> doc = await FirebaseFirestore
        .instance
        .collection('poems')
        .doc(poemUID.value)
        .get();
    Map<String, dynamic>? data = doc.data();
    if (data != null) {
      poem.value = Poem.fromJson(data);
    }
  }

  void loadPoem() {
    if (poem.value != null) {
      poemNameController.text =
          poem.value?.poemName?.words?.map((word) => word.local).join(' ') ??
              '';
      poemNameLatinController.text = poem.value?.poemName?.words
              ?.map((word) => word.latinTranslitaration)
              .join(' ') ??
          '';
      poetNameController.text = poem.value?.poetName ?? '';
      poemYTlinkController.text = poem.value?.recitationLinks?.join(' ') ?? '';
      poemTagsController.text = poem.value?.tags?.join(' ') ?? '';
    }
  }

  Future<void> savePoem() async {
    poem.value ??= Poem(poemName: PoemName(words: [Word()]));
    poem.value?.poemName?.words?.first.local = poemNameController.text;
    poem.value?.poemName?.words?.first.latinTranslitaration =
        poemNameLatinController.text;
    poem.value?.poetName = poetNameController.text;
    poem.value?.recitationLinks = poemYTlinkController.text.split(' ');
    poem.value?.tags = poemTagsController.text.split(' ');
    if (poemUID.value == '') {
      await FirebaseFirestore.instance.collection('poems').add(
            poem.value?.toJson() ?? {},
          );
    } else {
      await FirebaseFirestore.instance
          .collection('poems')
          .doc(poemUID.value)
          .set(
            poem.value?.toJson() ?? {},
          );
    }
  }

  @override
  void onClose() {
    poemNameController.dispose();
    poemNameLatinController.dispose();
    poetNameController.dispose();
    poemYTlinkController.dispose();
    poemTagsController.dispose();
    super.onClose();
  }
}
