import '../models/character.dart';

abstract class CharacterProvider {
  Future<Character?> fetchCharacter(String id);
  Future<List<Character>> fetchAllCharacters();
  Future<void> updateCharacter(Character character);
  Future<void> deleteCharacter(String id);
}
