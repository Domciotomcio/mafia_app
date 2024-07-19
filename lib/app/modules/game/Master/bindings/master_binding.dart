import 'package:get/get.dart';

import '../controllers/master_controller.dart';

class MasterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MasterController>(
      MasterController(),
      permanent: true,
    );
  }
}
