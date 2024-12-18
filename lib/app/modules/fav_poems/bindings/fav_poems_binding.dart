import 'package:get/get.dart';

import '../controllers/fav_poems_controller.dart';

class FavPoemsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavPoemsController>(
      () => FavPoemsController(),
    );
  }
}
