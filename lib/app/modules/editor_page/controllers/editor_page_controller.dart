import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mushaira/app/modules/home/model/poem_model.dart';

class EditorPageController extends GetxController {
  Rx<Poem?> poem = Rx(null);
  final TextEditingController poemNameController =
      TextEditingController(text: 'আনন্দলোকে মঙ্গলালোকে');
  final TextEditingController poemNameLatinController =
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
}
