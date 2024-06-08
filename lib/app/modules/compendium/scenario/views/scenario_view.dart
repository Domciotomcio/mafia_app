import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/scenario_controller.dart';

class ScenarioView extends GetView<ScenarioController> {
  const ScenarioView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScenarioView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ScenarioView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
