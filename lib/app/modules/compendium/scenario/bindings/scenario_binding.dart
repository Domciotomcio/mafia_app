import 'package:get/get.dart';

import '../controllers/scenario_controller.dart';

class ScenarioBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScenarioController>(
      () => ScenarioController(),
    );
  }
}
