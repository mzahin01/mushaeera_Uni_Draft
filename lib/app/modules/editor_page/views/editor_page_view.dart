import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/editor_page_controller.dart';

class EditorPageView extends GetView<EditorPageController> {
  const EditorPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditorPageView'),
        centerTitle: true,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.poemNameController,
              decoration: const InputDecoration(labelText: 'Poem Name'),
            ),
            TextField(
              controller: controller.poemNameLatinController,
              decoration: const InputDecoration(labelText: 'Poem Name latin'),
            ),
            TextField(
              controller: controller.poetNameController,
              decoration: const InputDecoration(labelText: 'Poet Name'),
            ),
            TextField(
              controller: controller.poemYTlinkController,
              decoration: const InputDecoration(
                  labelText: 'Recitation Links (space separated)'),
            ),
            TextField(
              // controller: controller.controller5,
              maxLines: null,
              decoration: const InputDecoration(labelText: 'texts'),
            ),
            TextField(
              // controller: controller.controller6,
              maxLines: null,
              decoration: const InputDecoration(labelText: 'texts latin'),
            ),
            TextField(
              controller: controller.poemTagsController,
              decoration: const InputDecoration(
                labelText: 'Texts latin',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.savePoem();
              },
              child: const Text('send to FB'),
            ),
          ],
        ),
      )),
    );
  }
}
