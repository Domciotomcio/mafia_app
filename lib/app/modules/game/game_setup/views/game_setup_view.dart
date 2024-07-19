import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/app/constants/maps/fraction.dart';

import '../../../../constants/enums/device.dart';
import '../../../../constants/enums/fraction.dart';
import '../controllers/game_setup_controller.dart';
import 'game_setup_characters.dart';

class GameSetupView extends GetView<GameSetupController> {
  GameSetupView({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
          title: const Text('Ustawienia gry'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            const SizedBox(height: 20),
            Obx(() => controller.isOfflineMode.value
                ? const SizedBox()
                : Column(
                    children: [
                      const Text("Kod gry", textAlign: TextAlign.center),
                      Text(
                        "1234",
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.displayLarge?.copyWith(
                                  letterSpacing: 5,
                                ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Tryb offline', style: TextStyle(fontSize: 18)),
                Obx(() => Switch(
                    value: controller.isOfflineMode.value,
                    onChanged: (value) {
                      controller.isOfflineMode.value = value;
                    })),
              ],
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(() => Text(
                    'Liczba postaci: ${controller.numberOfPlayers['total']!}',
                    style: GoogleFonts.dancingScript(fontSize: 25),
                  )),
            ),
            for (var item in playersMap)
              Obx(() => ListTile(
                  title: Text(item['title']! as String),
                  leading: item['leading'] as Widget,
                  trailing: SizedBox(
                      width: 110,
                      child: Row(children: [
                        IconButton(
                            onPressed:
                                controller.numberOfPlayers[item['name']]! > 0
                                    ? () => controller.removePlayerFromCount(
                                        item['fraction'] as Fraction)
                                    : null,
                            icon: const Icon(Icons.arrow_left)),
                        Text(
                          controller.numberOfPlayers[item['name'] as String]
                              .toString(),
                          style: GoogleFonts.dancingScript(fontSize: 20),
                        ),
                        IconButton(
                            onPressed: () => controller
                                .addPlayerToCount(item['fraction'] as Fraction),
                            icon: const Icon(Icons.arrow_right)),
                      ])))),

            const Divider(),

            // PLAYERS
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Gracze: ${controller.players.length}",
                      style: GoogleFonts.dancingScript(fontSize: 25)),
                  OutlinedButton.icon(
                      onPressed: () => Get.defaultDialog(
                            title: 'Dodaj gracza',
                            content: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Imię',
                                      border: OutlineInputBorder(),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Wprowadź imię';
                                      }
                                      return null;
                                    },
                                    controller: nameController,
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton.icon(
                                        onPressed: () {
                                          if (!_formKey.currentState!
                                              .validate()) {
                                            return;
                                          } else {
                                            controller.addPlayerWithName(
                                                nameController.text);
                                            nameController.clear();
                                            Get.back();
                                          }
                                        },
                                        icon: const Icon(Icons.check),
                                        label: const Text('Dodaj'),
                                      ),
                                      ElevatedButton.icon(
                                        onPressed: () => Get.back(),
                                        icon: const Icon(Icons.cancel_outlined),
                                        label: const Text('Anuluj'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                      icon: const Icon(Icons.add),
                      label: const Text('Dodaj gracza')),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Przeciągnij, aby zmienić kolejność",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Obx(
              () => SizedBox(
                height: controller.players.length * 60.0,
                child: ReorderableListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: controller.players
                      .map((item) => ListTile(
                            key: ValueKey(item),
                            title: Text(item.name),
                            leading: item.device == Device.main
                                ? const Icon(Icons.person)
                                : item.device == Device.mobile
                                    ? const Icon(Icons.smartphone_outlined)
                                    : const Icon(Icons.tablet),
                            trailing: IconButton(
                                onPressed: () {
                                  controller.players.remove(item);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                          ))
                      .toList(),
                  onReorder: (int oldIndex, int newIndex) =>
                      controller.onReorder(oldIndex, newIndex),
                ),
              ),
            ),
            const Divider(),

            // CHARACTERS
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => Text("Postacie: ${controller.characters.length}",
                      style: GoogleFonts.dancingScript(fontSize: 25))),
                  OutlinedButton.icon(
                      onPressed: () => Get.to(GameSetupCharacters()),
                      icon: const Icon(Icons.add),
                      label: const Text('Dodaj postać')),
                ],
              ),
            ),
            Obx(() => Column(
                  children: [
                    for (var item in controller.characters)
                      ListTile(
                        title: Text(item.name),
                        leading: fractionMap[item.fraction]!.image,
                        trailing: IconButton(
                            onPressed: () {
                              controller.removeCharacter(item);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                      ).animate().fadeIn(),
                  ],
                )),

            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: FilledButton(
                  onPressed: () => controller.setupGame(),
                  child: const Text('Rozpocznij grę')),
            ),
            const SizedBox(height: 20),
          ],
        ));
  }
}
