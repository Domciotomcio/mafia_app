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

  void playAudio(String path) async {
    if (!isPlaying.value) {
      await audioPlayer.play(AssetSource('audio/$path'));
      isPlaying.value = true;
    }
  }

  void stopAudio() async {
    await audioPlayer.stop();
    isPlaying.value = false;
  }
}
