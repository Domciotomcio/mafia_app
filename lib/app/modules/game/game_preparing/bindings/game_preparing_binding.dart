import 'package:get/get.dart';

import '../controllers/game_preparing_controller.dart';

class GamePreparingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GamePreparingController>(
      () => GamePreparingController(),
    );
  }
}
