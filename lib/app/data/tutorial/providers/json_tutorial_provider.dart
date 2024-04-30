import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:project/app/data/tutorial/models/tutorial.dart';

import 'tutorial_provider.dart';

class JsonTutorialProvider extends TutorialProvider {
  final String jsonPath;

  JsonTutorialProvider({required this.jsonPath});

  @override
  Future<void> deleteTutorial(String id) {
    // TODO: implement deleteTutorial
    throw UnimplementedError();
  }

  @override
  Future<List<Tutorial>> fetchAllTutorials() {
    // TODO: implement fetchAllTutorials
    throw UnimplementedError();
  }

  @override
  Future<Tutorial?> fetchTutorial(String id) async {
    try {
      // Fetch the tutorial from the JSON file
      var json = await rootBundle.loadString(jsonPath);
      var decoded = jsonDecode(json);

      // Parse the JSON file
      var data = Tutorial.fromJson(decoded);

      return data;
    } catch (e) {
      log("Error fetching tutorial: $e");
      return null;
    }
  }

  @override
  Future<void> updateTutorial(Tutorial tutorial) {
    // TODO: implement updateTutorial
    throw UnimplementedError();
  }
}
