import 'package:get/get.dart';
import 'package:project/app/modules/game/Master/controllers/master_controller.dart';

import '../../game_setup/controllers/game_setup_controller.dart';

class DayPhaseController extends GetxController {
  var checkOrKill = CheckOrKill.none.obs;
  var selectedPlayer = Rx<Player?>(null);

  @override
  void onInit() {
    super.onInit();
    print('DayPhaseController created, checkOrKill: $checkOrKill');
  }

  void setCheckOrKill(CheckOrKill value) {
    checkOrKill.value = value;
    selectedPlayer.value = null;
  }

  void setSelectedPlayer(Player player) {
    selectedPlayer.value = player;
  }

  void daySummary() {
    final gameSetup = Get.find<GameSetupController>();
    final MasterController master = Get.find<MasterController>();

    if (checkOrKill.value == CheckOrKill.kill) {
      master.movePlayerToDeadPlayers(selectedPlayer.value!);
    }

    Get.offAndToNamed('/night-phase');
  }
}

enum CheckOrKill { check, kill, none }
