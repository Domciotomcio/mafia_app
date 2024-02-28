import 'package:get/get.dart';

import '../controllers/fractions_controller.dart';

class FractionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FractionsController>(
      () => FractionsController(),
    );
  }
}
