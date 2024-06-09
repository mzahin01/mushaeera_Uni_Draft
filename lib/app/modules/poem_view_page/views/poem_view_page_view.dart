import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mushaira/app/routes/app_pages.dart';
import '../controllers/poem_view_page_controller.dart';

class PoemViewPageView extends GetView<PoemViewPageController> {
  const PoemViewPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.EDITOR_PAGE, arguments: controller.poem.value);
        },
        child: const Icon(Icons.logout),
      ),
      appBar: AppBar(
        title: Obx(() => Text(controller.poem.value?.poetName ?? 'Poem')),
      ),
      body: Obx(() {
        if (controller.poem.value == null) {
          return const Center(child: CircularProgressIndicator());
        } else {
          final poem = controller.poem.value!;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      poem.poemName!.words!.map((word) => word.local).join(' '),
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      poem.poetName ?? '',
                      style: const TextStyle(
                          fontSize: 20, fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 16),
                    ...poem.texts!.sentences!.map((sentence) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            sentence.words!.map((word) => word.local).join(' '),
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            sentence.words!
                                .map((word) => word.latinTranslitaration)
                                .join(' '),
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black),
                          ),
                          const SizedBox(height: 8),
                        ],
                      );
                    }),
                    const SizedBox(height: 16),
                    const Text(
                      'Recitation Links:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    ...poem.recitationLinks!.map((link) {
                      return InkWell(
                        onTap: () {},
                        child: Text(
                          link,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              decoration: TextDecoration.underline),
                        ),
                      );
                    }),
                    const SizedBox(height: 16),
                    const Text(
                      'Tags:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Wrap(
                      spacing: 8.0,
                      children: poem.tags!.map((tag) {
                        return Chip(
                          label: Text(tag),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      }),
    );
  }
}
