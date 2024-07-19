import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/modules/game/game_setup/controllers/game_setup_controller.dart';

import '../../../../shared/widgets/next_button.dart';
import '../../../../shared/widgets/player_list_tile.dart';

class GameSetupSummary extends GetView<GameSetupController> {
  const GameSetupSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MasterFirstView'.tr),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.home_rounded),
            onPressed: () {
              Get.dialog(AlertDialog(
                title: const Text('Czy na pewno chcesz wyjść?'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('Nie')),
                  TextButton(
                      onPressed: () {
                        Get.offAllNamed('/guidebook');
                      },
                      child: const Text('Tak')),
                ],
              ));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('Przeciągnij, aby zmienić kolejność'),
          Obx(() => Expanded(
                  child: ReorderableListView(
                onReorder: (int oldIndex, int newIndex) =>
                    controller.onReorder(oldIndex, newIndex),
                children: controller.players
                    .map<Widget>((player) => PlayerListTile(
                          player: player,
                          key: ValueKey(player),
                        ))
                    .toList(),
              ))),
          NextButton(
              onPressed: () => controller.startGame(),
              text: "Rozpocznij noc 0"),
        ],
      ),
    );
  }
}
