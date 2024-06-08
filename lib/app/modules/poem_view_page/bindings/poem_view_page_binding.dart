import 'package:get/get.dart';

import '../controllers/poem_view_page_controller.dart';

class PoemViewPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PoemViewPageController>(
      () => PoemViewPageController(),
    );
  }
}
