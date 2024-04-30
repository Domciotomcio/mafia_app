import '../models/tutorial.dart';
import '../providers/tutorial_provider.dart';

class TutorialRepository {
  final TutorialProvider tutorialProvider;

  TutorialRepository({required this.tutorialProvider});

  Future<Tutorial?> getTutorial(String id) async {
    final tutorialData = await tutorialProvider.fetchTutorial(id);
    return tutorialData;
  }
}
