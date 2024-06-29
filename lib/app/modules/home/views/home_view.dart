import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mushaira/app/modules/home/modals_reg_log/modal.dart';
import 'package:mushaira/app/modules/home/model/poem_model.dart';
import 'package:mushaira/app/modules/home/widgets/widget_base.dart';
import 'package:mushaira/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';
import '../widgets/drawer.dart';

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
        body: Column(
          children: [
            Container(
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
                  if (controller.userData.value?.role == 'Admin')
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
                  ] else ...[
                    Text(
                      controller.userData.value?.name ?? "",
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.scaffoldKey.currentState?.openEndDrawer();
                      },
                      child: const Icon(
                        Icons.list,
                        size: 35,
                      ),
                    ),
                  ],
                  SizedBox(
                    width: Get.width / 12.6,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.poem.length,
                itemBuilder: (context, index) {
                  Poem? localPoem = controller.poem[index];
                  String poemId = controller.poemUIDs[index] ?? '';
                  bool isFavorited =
                      controller.favoritePoemIds.contains(poemId);
                  return GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 118, 208, 249),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ListTile(
                        title: Text(
                          localPoem?.poemName?.words
                                  ?.map((word) => word.local)
                                  .join(' ') ??
                              '--',
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          localPoem?.poetName ?? '--',
                        ),
                        trailing: IconButton(
                          onPressed: () async {
                            await controller.toggleFavorite(poemId);
                          },
                          icon: Icon(
                            isFavorited
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            color: isFavorited ? Colors.red : Colors.white,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      Get.toNamed(
                        Routes.POEM_VIEW_PAGE,
                        parameters: {'poem_uid': poemId},
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      );
    });
  }
}
