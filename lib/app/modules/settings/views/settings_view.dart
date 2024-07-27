import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SettingsView'.tr),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ListTile(
              title: Text("Music".tr),
              subtitle: Text("Music in background".tr),
              trailing: Obx(() => Switch(
                  value: controller.backgroundMusicController.isPlaying.value,
                  onChanged: (value) {
                    controller.toggleBackgroundMusic();
                  })),
            ),
          ],
        ),
      ),
    );
  }
}
