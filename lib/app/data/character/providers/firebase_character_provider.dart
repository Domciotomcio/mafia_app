import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/app/data/character/models/character.dart';

import 'character_provider.dart';

class FirebaseCharacterProvider implements CharacterProvider {
  @override
  Future<bool> deleteCharacter(String id) async {
    try {
      await FirebaseFirestore.instance
          .collection('characters')
          .doc('characters_sets')
          .collection('default')
          .doc(id)
          .delete();

      return true;
    } catch (e) {
      log("Error while deleting character: ${e.toString()}");
      return false;
    }
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
  Future<bool> updateCharacter(String id, Character character) async {
    try {
      await FirebaseFirestore.instance
          .collection('characters')
          .doc('characters_sets')
          .collection('default')
          .doc(id)
          .update(character.toJson());

      return true;
    } catch (e) {
      log("Error while updating character: ${e.toString()}");
      return false;
    }
  }
}
