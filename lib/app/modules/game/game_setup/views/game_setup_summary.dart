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
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/howToPlay/end-game.webp'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.8), BlendMode.darken),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text('Przeciągnij, aby zmienić kolejność',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.grey)),
            ),
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
      ),
    );
  }
}
