import 'package:get/get.dart';
import 'package:project/app/data/tutorial/models/tutorial.dart';
import 'package:project/app/data/tutorial/services/tutorial_service.dart';

class HowToPlayController extends GetxController {
  var tutorialService = Get.find<TutorialService>();
  Tutorial? tutorial;

  @override
  Future<void> onInit() async {
    print(tutorialService.getTutorial('id'));
    tutorial = await tutorialService.getTutorial('id');
    super.onInit();
  }

  @override
  void onReady() {
    print(tutorial!.id);
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
