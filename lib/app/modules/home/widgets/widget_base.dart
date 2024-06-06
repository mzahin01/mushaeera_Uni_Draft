import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Module extends StatelessWidget {
  const Module({
    super.key,
    required this.widgName,
    required this.wayString,
    required this.iconman,
  });
  final String widgName;
  final String wayString;
  final IconData iconman;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: IconButton(
        onPressed: () {
          Get.toNamed(wayString);
        },
        icon: Row(
          children: [
            Icon(iconman),
            const SizedBox(width: 5),
            Text(widgName),
          ],
        ),
      ),
    );
  }
}

class OnTopNavBar extends StatelessWidget {
  const OnTopNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          GestureDetector(
            // onTap: controller.scaffoldKey.currentState?.openDrawer(),
            child: const Module(
              widgName: 'Classroom',
              wayString: '/home',
              iconman: Icons.menu_book,
            ),
          ),
          SizedBox(
            width: Get.width / 25,
          ),
          const Icon(Icons.list),
          SizedBox(
            width: Get.width / 12.6,
          ),
        ],
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 500,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.science,
                    size: 80,
                  ),
                  const Text("SCIENCE • LEVEL 3 >"),
                  const Text(
                    "3.1 Quantum \nMechanics with Sabine",
                    style: TextStyle(fontSize: 37, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(height: 7, width: 140, color: Colors.green),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                      "Discover the fundamental machinery of quantum \nmechanics"),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Icon(Icons.add_box),
                      SizedBox(
                        width: 6,
                      ),
                      Text("6 Lessons")
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
