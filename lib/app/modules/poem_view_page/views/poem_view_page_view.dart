import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mushaira/app/modules/home/controllers/home_controller.dart';
import 'package:mushaira/app/modules/home/model/poem_model.dart';
import 'package:mushaira/app/routes/app_pages.dart';
import 'package:share_plus/share_plus.dart';
import '../controllers/poem_view_page_controller.dart';

class PoemViewPageView extends GetView<PoemViewPageController> {
  const PoemViewPageView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(
            Routes.EDITOR_PAGE,
            parameters: {'poem_uid': controller.poemUID.value},
          );
        },
        child: const Icon(Icons.edit),
      ),
      appBar: AppBar(
        title: Obx(() => Text(controller.poem.value?.poetName ?? 'Poem')),
      ),
      body: Obx(() {
        if (controller.poem.value == null) {
          return const Center(child: CircularProgressIndicator());
        } else {
          Poem? poem = controller.poem.value;
          bool isFavorited = controller.isFavorite();

          // Convert the Poem object to a string representation
          String poemText = _poemToString(poem);

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      poem?.poemName?.words
                              ?.map((word) => word.local)
                              .join(' ') ??
                          '--',
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      poem?.poetName ?? '',
                      style: const TextStyle(
                          fontSize: 20, fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () async {
                            await controller.toggleFavorite();
                          },
                          icon: Icon(
                            isFavorited
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            color: isFavorited ? Colors.red : null,
                          ),
                        ),
                        const SizedBox(width: 16),
                        IconButton(
                          onPressed: () {
                            Share.share(poemText);
                          },
                          icon: const Icon(Icons.share),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ...?poem?.texts?.sentences?.map((sentence) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            sentence.words
                                    ?.map((word) => word.local)
                                    .join(' ') ??
                                '',
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            sentence.words
                                    ?.map((word) => word.latinTranslitaration)
                                    .join(' ') ??
                                '',
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
                    ...?poem?.recitationLinks?.map((link) {
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
                      children: poem?.tags?.map((tag) {
                            return Chip(
                              label: Text(tag),
                            );
                          }).toList() ??
                          [],
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

  // Method to convert Poem object to a string representation
  String _poemToString(Poem? poem) {
    if (poem == null) return '';
    String poemName =
        poem.poemName?.words?.map((word) => word.local).join(' ') ?? '';
    String poetName = poem.poetName ?? '';
    String text = poem.texts?.sentences
            ?.map((sentence) =>
                sentence.words?.map((word) => word.local).join(' ') ?? '')
            .join('\n') ??
        '';
    String tags = poem.tags?.join(', ') ?? '';
    return 'Poem: $poemName\n\nBy: $poetName\n\n$text\n\nTags: $tags';
  }
}
