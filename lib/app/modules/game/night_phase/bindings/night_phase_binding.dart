import 'package:get/get.dart';

import '../controllers/night_phase_controller.dart';

class NightPhaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NightPhaseController>(
      () => NightPhaseController(),
    );
  }
}
