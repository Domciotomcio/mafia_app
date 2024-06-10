import 'package:get/get.dart';
import 'package:project/app/shared/controllers/audio_controller.dart';

class SettingsController extends GetxController {
  AudioController backgroundMusicController =
      Get.find(tag: 'backgroundAudioController');

  void toggleBackgroundMusic() {
    if (backgroundMusicController.isPlaying.value) {
      backgroundMusicController.stopAudio();
    } else {
      backgroundMusicController.playAudio('audio/background.mp3', loop: true);
    }
  }
}
