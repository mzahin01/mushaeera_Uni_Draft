import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/fav_poems_controller.dart';

class FavPoemsView extends GetView<FavPoemsController> {
  const FavPoemsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FavPoemsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FavPoemsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
