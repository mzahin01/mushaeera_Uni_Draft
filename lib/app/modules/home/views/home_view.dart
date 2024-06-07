import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mushaira/app/modules/home/modals_reg_log/modal.dart';
import '../controllers/home_controller.dart';
import '../widgets/drawer.dart';
import '../widgets/widget_base.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        key: controller.scaffoldKey,
        endDrawer: const Drawer(
          child: DrawerMade(),
        ),
        body: Container(
          height: 75,
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 7,
              ),
            ],
          ),
          child: Row(
            children: [
              SizedBox(
                width: Get.width / 17,
              ),
              SizedBox(
                height: Get.width / 20,
                width: Get.width / 10,
                child: Image.asset("Assets/mulogo.png"),
              ),
              const SizedBox(
                width: 15,
              ),
              const Module(
                widgName: 'Home',
                wayString: '/home',
                iconman: Icons.home,
              ),
              const Module(
                widgName: 'Courses',
                wayString: '/home',
                iconman: Icons.line_style,
              ),
              const Module(
                widgName: 'Editor',
                wayString: '/editor-page',
                iconman: Icons.edit,
              ),
              Expanded(
                child: SizedBox(
                  width: Get.width / 25,
                ),
              ),
              if (controller.user.value == null) ...[
                ElevatedButton(
                  onPressed: () {
                    Get.dialog(
                      LoginModal(
                        controller: controller,
                      ),
                      barrierDismissible: false,
                    );
                  },
                  child: const Text('Log in'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.dialog(
                      RegistrationModal(
                        controller: controller,
                      ),
                      barrierDismissible: false,
                    );
                  },
                  child: const Text('Register Now'),
                ),
              ] else
                GestureDetector(
                  onTap: () {
                    controller.scaffoldKey.currentState?.openEndDrawer();
                  },
                  child: const Icon(
                    Icons.cabin,
                    size: 35,
                  ),
                ),
              SizedBox(
                width: Get.width / 12.6,
              ),
            ],
          ),
        ),
      );
    });
  }
}
