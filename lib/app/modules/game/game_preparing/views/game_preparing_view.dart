import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/game_preparing_controller.dart';

class GamePreparingView extends GetView<GamePreparingController> {
  const GamePreparingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GamePreparingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'GamePreparingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
