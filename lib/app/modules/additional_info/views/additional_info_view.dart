import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/additional_info_controller.dart';

class AdditionalInfoView extends GetView<AdditionalInfoController> {
  const AdditionalInfoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var author = 'Dominik Tomaszewski';
    var copyRight = 'Copyright 2024';

    return Scaffold(
      appBar: AppBar(
        title: Text('AdditionalInfoView'.tr),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Autor Aplikacji: $author'.tr),
            Text('Copyright: $copyRight'.tr),
          ],
        ),
      ),
    );
  }
}
