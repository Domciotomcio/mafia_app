import 'package:get/get.dart';

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
}

enum CheckOrKill { check, kill, none }
