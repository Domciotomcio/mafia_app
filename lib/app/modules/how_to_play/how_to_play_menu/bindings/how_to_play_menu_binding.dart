import 'package:get/get.dart';

import '../controllers/how_to_play_menu_controller.dart';

class HowToPlayMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HowToPlayMenuController>(
      () => HowToPlayMenuController(),
    );
  }
}
