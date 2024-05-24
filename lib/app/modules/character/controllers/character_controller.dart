import 'package:get/get.dart';
import 'package:project/app/data/character/services/character_service.dart';

import '../../../data/character/models/character.dart';

class CharacterController extends GetxController with StateMixin<Character> {
  final CharacterService characterService = Get.find();
  String id = ''; // can be passed as a parameter later
  Character? character;

  Future<void> fetchCharacter(String id) async {
    change(null, status: RxStatus.loading());
    try {
      Character? character = await characterService.getCharacter(id);
      if (character == null) {
        change(null, status: RxStatus.empty());
        return;
      }
      change(character, status: RxStatus.success());
    } catch (error) {
      change(null, status: RxStatus.error('Error fetching character'));
    }
  }
}
