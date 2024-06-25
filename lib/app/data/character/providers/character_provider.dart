import '../models/character.dart';

abstract class CharacterProvider {
  Future<Character?> fetchCharacter(String id);
  Future<List<Character>> fetchAllCharacters();
  Future<bool> updateCharacter(String id, Character character);
  Future<bool> deleteCharacter(String id);
}
