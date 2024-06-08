import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/app/constants/maps/fraction.dart';

import '../../../../constants/enums/fraction.dart';
import '../controllers/game_card_controller.dart';

class GameCardView extends GetView<GameCardController> {
  const GameCardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GameCardView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: FlipCard(
          direction: FlipDirection.HORIZONTAL,
          front: Obx(
            () => controller.cardReversed.value == false
                ? card(const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Naciśnij, by odwrócić kartę"),
                      SizedBox(width: 10),
                      Icon(Icons.reply),
                    ],
                  ))
                : card(nextRow()),
          ),
          back: card(characterRow(context)),
          onFlipDone: (isFront) => controller.cardReversed.value = true,
        ),
      ),
    );
  }

  Widget card(Widget content) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            spreadRadius: 2,
            offset: Offset(2, 2),
          ),
        ],
      ),
      height: double.infinity,
      width: double.infinity,
      child: Center(
        child: content,
      ),
    );
  }

  Widget characterRow(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Mieszaniec", style: GoogleFonts.dancingScript(fontSize: 30)),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Miasteczko",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
            ),
            const SizedBox(width: 10),
            fractionMap[Fraction.townsfolk]!.image,
          ],
        ),
      ],
    );
  }

  Widget nextRow() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.transparent,
        child: Center(
          child: FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward),
              label: const Text("Przekaż telefon kolejnej osobie")),
        ),
      ),
    );
  }
}
