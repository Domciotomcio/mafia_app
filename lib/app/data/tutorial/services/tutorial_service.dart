import 'package:get/get.dart';

import '../models/tutorial.dart';
import '../repositories/tutorial_repository.dart';

class TutorialService extends GetxService {
  final TutorialRepository tutorialRepository;

  TutorialService({required this.tutorialRepository});

  Future<TutorialService> init() async {
    return this;
  }

  Future<Tutorial?> getTutorial(String id) async {
    final tutorial = await tutorialRepository.getTutorial(id);
    return tutorial;
  }
}
