import 'dart:developer';

import 'package:get/get.dart';

import '../repositories/character_repository.dart';
import '../models/character.dart';

class CharacterService extends GetxService {
  final CharacterRepository characterRepository;

  CharacterService({required this.characterRepository});

  Future<CharacterService> init() async {
    log('CharacterService.init');
    return this;
  }

  Future<Character?> getCharacter(String id) async {
    final character = await characterRepository.getCharacter(id);
    return character;
  }

  Future<List<Character>> getAllCharacters() async {
    final characters = await characterRepository.getAllCharacters();
    return characters;
  }

  Future<void> updateCharacter(String id, Character character) async {
    await characterRepository.updateCharacter(id, character);
  }

  Future<void> deleteCharacter(String id) async {
    await characterRepository.deleteCharacter(id);
  }
}
