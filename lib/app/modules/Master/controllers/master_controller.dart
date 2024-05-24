import 'package:get/get.dart';

import '../../game_setup/controllers/game_setup_controller.dart';

class MasterController extends GetxController {
  var gameSetup = Get.find<GameSetupController>();

  var playersList;

  var nightZeroPhases = [
    'mafia',
  ];

  var nightPhases = [
    'mafia',
    'cattani',
    'doctor',
  ];

  var dayPhases = [
    'check-kill',
    'vote',
  ];

  var actPhase = 'mafia';

  @override
  void onInit() {
    playersList = gameSetup.players;

    super.onInit();
  }

  // mafia roles -ERRORS
  void getMafiaRoles() {
    playersList
        .where((player) => player.character!.fraction == 'mafia')
        .toList();
  }
}
