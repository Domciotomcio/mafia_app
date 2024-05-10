import 'package:get/get.dart';
import 'package:project/app/constants/enums/fraction.dart';

import '../../Master/controllers/master_controller.dart';
import '../../game_setup/controllers/game_setup_controller.dart';

class MasterNightZeroController extends GetxController {
  var playersList;

  late MasterController master;
  var gameSetup;

  List<String> charactersToWakeUp = [
    'mafiaLeader',
    'syndicateLeader',
  ];

  @override
  void onInit() {
    gameSetup = Get.find<GameSetupController>();
    master = Get.find<MasterController>();

    playersList = gameSetup.players;
    // master.getMafiaRoles();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  List<Player> getPlayersToWakeUp(Fraction fraction) {
    return playersList
        .where((player) => player.character!.fraction == fraction)
        .where(
            (player) => charactersToWakeUp.contains(player.character!.nameId))
        .toList();
  }
}
