import 'package:project/app/data/character/providers/character_provider.dart';

import '../models/character.dart';

class CharacterRepository {
  final CharacterProvider characterProvider;

  CharacterRepository({required this.characterProvider});

  Future<Character?> getCharacter(String id) async {
    final characterData = await characterProvider.fetchCharacter(id);
    return characterData;
  }

  Future<List<Character>> getAllCharacters() async {
    final charactersData = await characterProvider.fetchAllCharacters();
    return charactersData;
  }

  Future<void> updateCharacter(Character character) async {
    await characterProvider.updateCharacter(character);
  }

  Future<void> deleteCharacter(String id) async {
    await characterProvider.deleteCharacter(id);
  }
}
