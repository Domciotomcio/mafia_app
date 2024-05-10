import 'package:get/get.dart';
import 'package:project/app/modules/Master_night_zero/bindings/master_night_zero_binding.dart';

import '../../game_setup/controllers/game_setup_controller.dart';
import '../../Master_night_zero/views/master_night_zero_view.dart';

class MasterController extends GetxController {
  var gameSetup;

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
    var gameSetup = Get.find<GameSetupController>();
    print(gameSetup.numberOfPlayers);

    playersList = gameSetup.players;

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    Get.toNamed('/master-night-zero');
  }

  @override
  void onClose() {
    super.onClose();
  }

  // mafia roles -ERRORS
  void getMafiaRoles() {
    List<String> mafiaRoles = playersList
        .where((player) => player.character!.fraction == 'mafia')
        .toList();
    print(mafiaRoles);
  }
}
