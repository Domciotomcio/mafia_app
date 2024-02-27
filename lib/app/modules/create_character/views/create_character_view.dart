import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/create_character_controller.dart';

class CreateCharacterView extends GetView<CreateCharacterController> {
  const CreateCharacterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CreateCharacterView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CreateCharacterView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
