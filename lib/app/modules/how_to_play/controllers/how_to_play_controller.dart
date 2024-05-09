import 'package:get/get.dart';
import 'package:project/app/data/tutorial/models/tutorial.dart';
import 'package:project/app/data/tutorial/services/tutorial_service.dart';

class HowToPlayController extends GetxController with StateMixin<Tutorial> {
  var tutorialService = Get.find<TutorialService>();
  Tutorial? tutorial;

  @override
  Future<void> onInit() async {
    print(tutorialService.getTutorial('id'));
    change(null, status: RxStatus.loading());
    tutorial = await tutorialService.getTutorial('id');
    change(tutorial, status: RxStatus.success());
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
