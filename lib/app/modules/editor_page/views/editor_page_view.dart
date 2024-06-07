import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/editor_page_controller.dart';

class EditorPageView extends GetView<EditorPageController> {
  EditorPageView({super.key});
  final TextEditingController controller1 =
      TextEditingController(text: 'আনন্দলোকে মঙ্গলালোকে');
  final TextEditingController controller2 =
      TextEditingController(text: 'Anandalöke mangalalöke');
  final TextEditingController controller3 =
      TextEditingController(text: 'RabindraNath Tagore');
  final TextEditingController controller4 =
      TextEditingController(text: 'eknumber.com duinumber.com');
  final TextEditingController controller5 = TextEditingController(
      text:
          'আনন্দলোকে মঙ্গলালোকে বিরাজ সত্যসুন্দর। মহিমা তব উদ্ভাসিত মহাগগনমাঝে। বিশ্বজগত মণিভূষণ বেষ্টিত চরণে। আনন্দলোকে মঙ্গলালোকে বিরাজ সত্যসুন্দর।।');
  final TextEditingController controller6 = TextEditingController(
      text:
          'Anandalöke mangalalöke biraja satyasundara. Mahima taba udbhasita mahagaganamajhe. Bisbajagata manibhusana bestita carane. Anandalökē mangalälöke birãja satyasundara..');
  final TextEditingController controller7 =
      TextEditingController(text: 'top2k Spiritual Awsome');
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
              controller: controller1,
              decoration: const InputDecoration(labelText: 'Poem Name'),
            ),
            TextField(
              controller: controller2,
              decoration: const InputDecoration(labelText: 'Poem Name latin'),
            ),
            TextField(
              controller: controller3,
              decoration: const InputDecoration(labelText: 'Poet Name'),
            ),
            TextField(
              controller: controller4,
              decoration: const InputDecoration(
                  labelText: 'Recitation Links (space separated)'),
            ),
            TextField(
              controller: controller5,
              decoration: const InputDecoration(labelText: 'texts'),
            ),
            TextField(
              controller: controller6,
              decoration: const InputDecoration(labelText: 'texts latin'),
            ),
            TextField(
              controller: controller7,
              decoration:
                  const InputDecoration(labelText: 'tags (space separated)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Submit'),
            ),
          ],
        ),
      )),
    );
  }
}
