import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/scenarios_controller.dart';

class ScenariosView extends GetView<ScenariosController> {
  const ScenariosView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScenariosView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ScenariosView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
