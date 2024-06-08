import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/join_game_controller.dart';

class JoinGameView extends GetView<JoinGameController> {
  const JoinGameView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JoinGameView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'JoinGameView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
