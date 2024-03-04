import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/additional_info_controller.dart';

class AdditionalInfoView extends GetView<AdditionalInfoController> {
  const AdditionalInfoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dodatkowe Informacje'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AdditionalInfoView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
