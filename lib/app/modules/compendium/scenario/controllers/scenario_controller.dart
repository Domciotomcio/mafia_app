import 'package:get/get.dart';

class ScenarioController extends GetxController {
  var scenario;

  @override
  void onInit() {
    scenario = Get.arguments['scenario'];
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
