import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../how_to_play_menu/controllers/how_to_play_menu_controller.dart';

class HowToPlayController extends GetxController {
  late Section section;

  @override
  void onInit() {
    section = Get.arguments as Section;
    super.onInit();
  }
}
