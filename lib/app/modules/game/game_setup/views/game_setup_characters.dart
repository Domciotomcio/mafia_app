import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/app/constants/maps/fraction.dart';
import 'package:project/app/modules/compendium/characters/controllers/characters_controller.dart';

import '../../../../constants/enums/fraction.dart';
import '../../../../data/character/models/character.dart';
import '../controllers/game_setup_controller.dart';

class GameSetupCharacters extends GetView<GameSetupController> {
  GameSetupCharacters({Key? key}) : super(key: key);

  var charactersController = Get.put(CharactersController());

  @override
  Widget build(BuildContext context) {
    final playersMap = {
      {
        'leading': fractionMap[Fraction.mafia]!.image,
        'title': 'Liczba mafii',
        'name': 'mafia',
        'fraction': Fraction.mafia,
        'value': controller.numberOfPlayers['mafia']!,
      },
      {
        'leading': fractionMap[Fraction.townsfolk]!.image,
        'title': 'Liczba miasta',
        'name': 'townsfolk',
        'fraction': Fraction.townsfolk,
        'value': controller.numberOfPlayers['townsfolk']!,
      },
      {
        'leading': fractionMap[Fraction.sindicate]!.image,
        'title': 'Liczba syndykatu',
        'name': 'sindicate',
        'fraction': Fraction.sindicate,
        'value': controller.numberOfPlayers['sindicate']!,
      },
      {
        'leading': fractionMap[Fraction.redMafia]!.image,
        'title': 'Liczba czerwonej mafii',
        'name': 'redMafia',
        'fraction': Fraction.redMafia,
        'value': controller.numberOfPlayers['redMafia']!,
      },
    };

    return Scaffold(
        appBar: AppBar(
          title: const Text('GameSetupCharactersView'),
          centerTitle: true,
        ),
        body: charactersController.obx(
          (state) => ListView.separated(
            itemCount: state!.length,
            itemBuilder: (context, index) {
              Character character = state[index];
              var fraction = fractionMap[character.fraction]!;

              return ListTile(
                title: Text(character.name,
                    style: GoogleFonts.dancingScript(fontSize: 24)),
                subtitle: Text(character.otherNames.join(', '),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontStyle: FontStyle.italic,
                        )),
                trailing: fraction.image,
                onTap: () {
                  // add character to gameSetupController
                  controller.addCharacter(character);
                  Get.back();
                },
              );
            },
            separatorBuilder: (context, index) => const Divider(),
          ),
        ));
  }
}
