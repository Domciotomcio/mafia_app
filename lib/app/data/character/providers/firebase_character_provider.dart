import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/app/data/character/models/character.dart';

import 'character_provider.dart';

class FirebaseCharacterProvider implements CharacterProvider {
  @override
  Future<void> deleteCharacter(String id) {
    // TODO: implement deleteCharacter
    throw UnimplementedError();
  }

  @override
  Future<List<Character>> fetchAllCharacters() async {
    try {
      // fetch data from firebase
      var querySnapshot = await FirebaseFirestore.instance
          .collection('characters')
          .doc('characters_sets')
          .collection('default')
          .get();

      List<Character> characters = querySnapshot.docs.map((doc) {
        return Character.fromJson(doc.data());
      }).toList();

      log("Characters fetched from firebase: $characters");
      return characters;
    } catch (e) {
      log("Error while fetching characters: ${e.toString()}");
      return List.empty();
    }
  }

  @override
  Future<Character?> fetchCharacter(String id) async {
    try {
      // fetch data from firebase
      var docSnapshot = await FirebaseFirestore.instance
          .collection('characters')
          .doc('characters_sets')
          .collection('default')
          .doc(id)
          .get();

      return docSnapshot.exists
          ? Character.fromJson(docSnapshot.data()!)
          : null;
    } catch (e) {
      log("Error while fetching character: ${e.toString()}");
      return null;
    }
  }

  @override
  Future<void> updateCharacter(Character character) {
    // TODO: implement updateCharacter
    throw UnimplementedError();
  }
}
