import 'package:get/get.dart';

import '../../../../data/fraction/models/fraction.dart';
import '../../../../shared/controllers/audio_controller.dart';

class FractionController extends GetxController {
  late Fraction fraction;

  final audioController = Get.put(AudioController());

  @override
  void onInit() {
    print("IM IN ONINIT");
    fraction = Get.arguments['id'] as Fraction;
    super.onInit();
  }

  void toggleAudio() {
    if (fraction.audioPath == null) return;

    if (audioController.isPlaying.value) {
      audioController.stopAudio();
    } else {
      audioController.playAudio("audio/${fraction.audioPath!}");
    }
  }
}
