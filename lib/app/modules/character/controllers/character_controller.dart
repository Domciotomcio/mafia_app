import 'package:get/get.dart';
import 'package:project/app/data/character/services/character_service.dart';

import '../../../data/character/models/character.dart';

class CharacterController extends GetxController with StateMixin<Character> {
  final CharacterService characterService = Get.find();
  String id = ''; // can be passed as a parameter later
  Character? character;

  @override
  void onInit() {
    print("IM IN ONINIT");
    super.onInit();
    //id = Get.parameters['id']!;
    // character = Get.parameters['id'] as Character;
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

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
