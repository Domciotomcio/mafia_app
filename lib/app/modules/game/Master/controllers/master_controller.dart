import 'package:get/get.dart';
import 'package:project/app/constants/enums/fraction.dart';

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

  int getNumberOfPlayers(String fraction) {
    switch (fraction) {
      case 'all':
        return playersList.length;
      case 'mafia':
        return playersList
            .where((player) => player.character!.fraction == Fraction.mafia)
            .toList()
            .length;
      case 'townsfolk':
        return playersList
            .where((player) => player.character!.fraction == Fraction.townsfolk)
            .toList()
            .length;
      case 'sindicate':
        return playersList
            .where((player) => player.character!.fraction == Fraction.sindicate)
            .toList()
            .length;
      case 'red_mafia':
        return playersList
            .where((player) => player.character!.fraction == Fraction.redMafia)
            .toList()
            .length;
      default:
        return -1;
    }
  }
}
