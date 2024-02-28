import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/fraction_controller.dart';

class FractionView extends GetView<FractionController> {
  const FractionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FractionView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FractionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
