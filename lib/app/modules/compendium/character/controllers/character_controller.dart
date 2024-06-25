import 'package:get/get.dart';
import 'package:project/app/data/character/services/character_service.dart';

import '../../../../data/character/models/character.dart';
import '../../../../shared/controllers/audio_controller.dart';

class CharacterController extends GetxController with StateMixin<Character> {
  final CharacterService characterService = Get.find();
  String id = ''; // can be passed as a parameter later
  Character? character;

  final audioController = Get.put(AudioController());

  @override
  void onInit() {
    print("IM IN ONINIT");

    id = Get.parameters['id']!;
    character = Get.arguments['id'] as Character;
    super.onInit();
    //fetchCharacter(id);
  }

  // Future<void> fetchCharacter(String id) async {
  //   change(null, status: RxStatus.loading());
  //   try {
  //     Character? character = await characterService.getCharacter(id);
  //     if (character == null) {
  //       change(null, status: RxStatus.empty());
  //       return;
  //     }
  //     change(character, status: RxStatus.success());
  //   } catch (error) {
  //     change(null, status: RxStatus.error('Error fetching character'));
  //   }
  // }

  Future<void> fetchCharacter(String id) async {
    Character? character = await characterService.getCharacter(id);
    //this.character = character;
    change(character, status: RxStatus.success());
  }

  void toggleAudio() {
    if (character!.audioPath == null) return;

    if (audioController.isPlaying.value) {
      audioController.stopAudio();
    } else {
      audioController.playAudio("audio/${character!.audioPath!}");
    }

    // if (audioPlayer.playing) {
    //   audioPlayer.pause();
    // } else {
    //   audioPlayer.play(character!.audioPath!);
    // }
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
