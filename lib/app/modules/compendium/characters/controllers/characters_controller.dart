import 'package:get/get.dart';

import '../../../../data/character/models/character.dart';
import '../../../../data/character/services/character_service.dart';

class CharactersController extends GetxController
    with StateMixin<List<Character>> {
  var service = Get.find<CharacterService>();

  var sortType = 'name';

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
      sortCharacters(sortType);
    }
  }

  void toggleSort() {
    var sortTypes = ['name', 'fraction'];
    var index = sortTypes.indexOf(sortType);
    sortType = sortTypes[(index + 1) % sortTypes.length];
    sortCharacters(sortType);
  }

  void sortCharacters(String sortType) async {
    change(state, status: RxStatus.loading());
    await Future.delayed(const Duration(milliseconds: 20));
    var characters = state;
    if (sortType == 'name') {
      characters!.sort((a, b) => a.name.compareTo(b.name));
    } else if (sortType == 'fraction') {
      characters!.sort((a, b) => a.fraction.name.compareTo(b.fraction.name));
    }
    change(characters, status: RxStatus.success());
  }
}
