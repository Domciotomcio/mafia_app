import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/how_to_play_menu_controller.dart';

class HowToPlayMenuView extends GetView<HowToPlayMenuController> {
  const HowToPlayMenuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HowToPlayMenuView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HowToPlayMenuView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
