import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constants/maps/fraction.dart';
import '../../game_setup/controllers/game_setup_controller.dart';
import '../controllers/master_controller.dart';

class MasterView extends GetView<MasterController> {
  const MasterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MasterView'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: controller.playersList.length,
        itemBuilder: (context, index) {
          Player player = controller.playersList[index];

          return ListTile(
            title: Text(player.name),
            subtitle: Text(player.character!.name),
            leading: fractionMap[player.character?.fraction]!.image,
          );
        },
      ),
    );
  }
}
