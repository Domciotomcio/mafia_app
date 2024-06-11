import 'package:flutter/material.dart';

import '../../constants/maps/fraction.dart';
import '../../modules/game/game_setup/controllers/game_setup_controller.dart';

class PlayerListTile extends StatelessWidget {
  final Player player;
  final void Function()? onPressed;

  const PlayerListTile({Key? key, required this.player, this.onPressed = null})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(player.name),
      subtitle: Text(
        player.character!.name,
        style: const TextStyle(color: Colors.grey),
      ),
      leading: fractionMap[player.character!.fraction]!.image,
      onTap: onPressed,
    );
  }
}
