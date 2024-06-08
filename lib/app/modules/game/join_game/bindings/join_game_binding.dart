import 'package:get/get.dart';

import '../controllers/join_game_controller.dart';

class JoinGameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JoinGameController>(
      () => JoinGameController(),
    );
  }
}
