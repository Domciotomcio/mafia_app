import 'package:get/get.dart';

import '../controllers/fraction_controller.dart';

class FractionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FractionController>(
      () => FractionController(),
    );
  }
}
