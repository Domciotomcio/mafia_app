import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class AudioController extends GetxController {
  final AudioPlayer audioPlayer = AudioPlayer();
  final AudioCache audioCache = AudioCache();
  final RxBool isPlaying = false.obs;

  @override
  void onClose() {
    audioPlayer.dispose();
    super.onClose();
  }

  void playAudio(String path, {bool? loop, double? volume = 0.5}) async {
    if (!isPlaying.value) {
      if (loop != null && loop == true) {
        await audioPlayer.setReleaseMode(ReleaseMode.loop);
      }
      await audioPlayer.play(AssetSource('$path'), volume: volume);
      isPlaying.value = true;
    }
  }

  void stopAudio() async {
    await audioPlayer.stop();
    isPlaying.value = false;
  }
}
