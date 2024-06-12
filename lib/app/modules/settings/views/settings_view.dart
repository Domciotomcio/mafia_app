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
            Obx(() => ElevatedButton.icon(
                onPressed: () => controller.toggleBackgroundMusic(),
                icon:
                    controller.backgroundMusicController.isPlaying.value == true
                        ? Icon(Icons.volume_up)
                        : Icon(Icons.volume_off),
                label: Text("Muzyka w tle")))
          ],
        ),
      ),
    );
  }
}
