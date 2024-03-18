import 'package:get/get.dart';

import '../controllers/game_card_controller.dart';

class GameCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GameCardController>(
      () => GameCardController(),
    );
  }
}
