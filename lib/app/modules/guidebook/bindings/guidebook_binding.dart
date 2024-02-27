import 'package:get/get.dart';

import '../controllers/guidebook_controller.dart';

class GuidebookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GuidebookController>(
      () => GuidebookController(),
    );
  }
}
