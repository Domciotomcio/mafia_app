import 'package:get/get.dart';

import '../controllers/scenarios_controller.dart';

class ScenariosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScenariosController>(
      () => ScenariosController(),
    );
  }
}
