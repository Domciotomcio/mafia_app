import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/day_phase_controller.dart';

class DayPhaseView extends GetView<DayPhaseController> {
  const DayPhaseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DayPhaseView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DayPhaseView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
