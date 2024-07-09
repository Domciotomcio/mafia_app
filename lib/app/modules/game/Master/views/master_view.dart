import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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

Widget WeatherForecastWidget() {
  final MasterController controller = Get.find<MasterController>();

  Map<String, int> numOfPlayers = {
    'all': controller.getNumberOfPlayers('all'),
    'townsfolk': controller.getNumberOfPlayers('townsfolk'),
    'mafia': controller.getNumberOfPlayers('mafia'),
    'sindicate': controller.getNumberOfPlayers('sindicate'),
    'red_mafia': controller.getNumberOfPlayers('red_mafia'),
  };

  Widget weatherRow(String text, int number) {
    return Row(
      children: [
        Text(text),
        Text(number.toString(), style: const TextStyle(fontSize: 24)),
      ],
    );
  }

  return Container(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        weatherRow("Liczba postaci:", numOfPlayers['all']!),
        weatherRow("Liczba miastowych:", numOfPlayers['townsfolk']!),
        weatherRow("Liczba mafii:", numOfPlayers['mafia']!),
        weatherRow("Liczba syndykatu:", numOfPlayers['sindicate']!),
      ],
    ),
  );
}
