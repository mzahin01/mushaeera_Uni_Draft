import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mushaira/app/modules/home/controllers/home_controller.dart';
import 'package:mushaira/app/modules/home/model/poem_model.dart';

class PoemViewPageController extends GetxController {
  Rx<Poem?> poem = Rx(null);
  RxString poemUID = ''.obs;
  final HomeController homeController = Get.find<HomeController>();

  @override
  void onInit() {
    poemUID.value = Get.parameters['poem_uid'] ?? '';
    fetchPoem();
    super.onInit();
  }

  Future<void> fetchPoem() async {
    DocumentSnapshot<Map<String, dynamic>> doc = await FirebaseFirestore
        .instance
        .collection('poems')
        .doc(poemUID.value)
        .get();
    Map<String, dynamic>? data = doc.data();
    poem.value = Poem.fromJson(data ?? {});
  }

  Future<void> toggleFavorite() async {
    await homeController.toggleFavorite(poemUID.value);
  }

  bool isFavorite() {
    return homeController.favoritePoemIds.contains(poemUID.value);
  }
}
