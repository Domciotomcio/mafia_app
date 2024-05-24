import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:project/app/shared/widgets/next_button.dart';

import '../../../constants/maps/fraction.dart';
import '../../game_setup/controllers/game_setup_controller.dart';
import '../controllers/master_controller.dart';

class MasterFirstView extends GetView<MasterController> {
  MasterFirstView({Key? key}) : super(key: key);

  var masterFirstController = Get.put(MasterFirstController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MasterFirstView'),
        centerTitle: true,
        actions: [
          // IconButton(
          //   onPressed: () {
          //     masterFirstController.showFirstCharacter.value =
          //         !masterFirstController.showFirstCharacter.value;

          //     if (masterFirstController.showFirstCharacter.value) {
          //       controller.playersList.sort(
          //           (a, b) => (a as Player).name.compareTo((b as Player).name));
          //     } else {
          //       controller.playersList.sort((a, b) {
          //         int fractionCompare = (a as Player)
          //             .character!
          //             .fraction
          //             .index
          //             .compareTo((b as Player).character!.fraction.index);
          //         if (fractionCompare == 0) {
          //           return (a as Player)
          //               .character!
          //               .name
          //               .compareTo((b as Player).character!.name);
          //         } else {
          //           return fractionCompare;
          //         }
          //       });
          //     }
          //   },
          //   icon: const Icon(Icons.sort_outlined),
          // ),
        ],
      ),
      body: Column(
        children: [
          Text('Wszyscy Gracze'),
          Expanded(
            child: Obx(() => ListView.builder(
                  itemCount: controller.playersList.length,
                  itemBuilder: (context, index) {
                    Player player = controller.playersList[index];
                    print(masterFirstController.showFirstCharacter.value);

                    return Obx(() => SizedBox(
                        child: masterFirstController.showFirstCharacter.value
                            ? ListTile(
                                title: Text(player.name),
                                subtitle: Text(player.character!.name,
                                    style: TextStyle(color: Colors.grey)),
                                leading:
                                    fractionMap[player.character?.fraction]!
                                        .image,
                              )
                            : ListTile(
                                title: Text(player.character!.name),
                                subtitle: Text(player.name,
                                    style: TextStyle(color: Colors.grey)),
                                leading:
                                    fractionMap[player.character?.fraction]!
                                        .image,
                              )));
                  },
                )),
          ),
          //NextButton(onPressed: () => print("SIEMA"), text: "Zacznij noc 0"),
          NextButton(
              onPressed: () => Get.toNamed('/master-night-zero'),
              text: "Rozpocznij noc 0"),
        ],
      ),
    );
  }
}

class MasterFirstController extends GetxController {
  RxBool showFirstCharacter = true.obs;
}
