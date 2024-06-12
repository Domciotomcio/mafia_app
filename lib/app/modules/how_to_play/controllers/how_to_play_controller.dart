import 'package:get/get.dart';
import 'package:project/app/data/tutorial/models/tutorial.dart';
import 'package:project/app/data/tutorial/services/tutorial_service.dart';

class HowToPlayController extends GetxController with StateMixin<Tutorial> {
  var tutorialService = Get.find<TutorialService>();
  Tutorial? tutorial;

  @override
  Future<void> onInit() async {
    change(null, status: RxStatus.loading());
    tutorial = await tutorialService.getTutorial('id');
    print(tutorial!); // prints 3 (example
    change(tutorial, status: RxStatus.success());
    super.onInit();
  }
}
