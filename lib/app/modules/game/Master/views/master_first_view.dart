import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project/app/shared/widgets/next_button.dart';

import '../../../../shared/widgets/player_list_tile.dart';
import '../../game_setup/controllers/game_setup_controller.dart';
import '../controllers/master_controller.dart';

class MasterFirstView extends GetView<MasterController> {
  MasterFirstView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MasterFirstView'.tr),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Text('Przeciągnij, aby zmienić kolejność'),
          Expanded(
              child: ReorderableListView(
            onReorder: (int oldIndex, int newIndex) =>
                controller.gameSetup.onReorder(oldIndex, newIndex),
            children: controller.playersList.map((player) => PlayerListTile(
                  player: player,
                  key: ValueKey(player),
                )),
          )),
          Expanded(
            child: Obx(() => ListView.builder(
                  itemCount: controller.playersList.length,
                  itemBuilder: (context, index) {
                    Player player = controller.playersList[index];

                    return SizedBox(
                        child: PlayerListTile(
                      player: player,
                    ));
                  },
                )),
          ),
          NextButton(
              onPressed: () => Get.toNamed('/master-night-zero'),
              text: "Rozpocznij noc 0"),
        ],
      ),
    );
  }
}
