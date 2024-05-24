import 'package:get/get.dart';

import '../controllers/master_night_zero_controller.dart';

class MasterNightZeroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MasterNightZeroController>(
      () => MasterNightZeroController(),
    );
  }
}
