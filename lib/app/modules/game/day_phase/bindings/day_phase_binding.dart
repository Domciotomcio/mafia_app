import 'package:get/get.dart';

import '../controllers/day_phase_controller.dart';

class DayPhaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DayPhaseController>(
      () => DayPhaseController(),
    );
  }
}
