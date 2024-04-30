import '../models/tutorial.dart';

abstract class TutorialProvider {
  Future<Tutorial?> fetchTutorial(String id);
  Future<List<Tutorial>> fetchAllTutorials();
  Future<void> updateTutorial(Tutorial tutorial);
  Future<void> deleteTutorial(String id);
}
