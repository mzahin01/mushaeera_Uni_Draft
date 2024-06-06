import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../widgets/widget_base.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey, // Assign GlobalKey to Scaffold
      endDrawer: Drawer(
        // Change drawer to endDrawer
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.contacts),
              title: const Text('Contacts'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
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
              widgName: 'Classroom',
              wayString: '/home',
              iconman: Icons.menu_book,
            ),
            Expanded(
              child: SizedBox(
                width: Get.width / 25,
              ),
            ),
            GestureDetector(
              onTap: () {
                // Correctly open endDrawer on tap
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
  }
}
