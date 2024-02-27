import 'package:get/get.dart';

import '../../../data/character/models/character.dart';
import '../../../data/character/services/character_service.dart';

class CharactersController extends GetxController
    with StateMixin<List<Character>> {
  var service = Get.find<CharacterService>();

  @override
  Future<void> onInit() async {
    super.onInit();
    change(null, status: RxStatus.loading());
    await fetchCharacters();
  }

  Future<void> fetchCharacters() async {
    var characters = await service.getAllCharacters();
    await Future.delayed(const Duration(seconds: 1));

    if (characters.isEmpty) {
      change([], status: RxStatus.empty());
    } else {
      change(characters, status: RxStatus.success());
    }
  }
}
