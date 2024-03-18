import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/app/constants/maps/fraction.dart';

import '../../../constants/enums/device.dart';
import '../../../constants/enums/fraction.dart';
import '../controllers/game_setup_controller.dart';

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
            SizedBox(height: 20),
            Text(
              "1234",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(letterSpacing: 5),
            ),
            Text("Kod gry", textAlign: TextAlign.center),
            SizedBox(height: 20),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Liczba wszystkich graczy',
                    style: GoogleFonts.dancingScript(fontSize: 25),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: Obx(
                      () => Text(
                        controller.numberOfPlayers['total']!.toString(),
                        style: const TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            for (var item in playersMap)
              ListTile(
                  title: Text(item['title']! as String),
                  leading: item['leading'] as Widget,
                  trailing: Container(
                      width: 110,
                      child: Row(children: [
                        IconButton(
                            onPressed: () => controller.removePlayerFromCount(
                                item['fraction'] as Fraction),
                            icon: Icon(Icons.arrow_left)),
                        Obx(
                          () => Text(
                            controller.numberOfPlayers[item['name'] as String]
                                .toString(),
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        IconButton(
                            onPressed: () => controller
                                .addPlayerToCount(item['fraction'] as Fraction),
                            icon: Icon(Icons.arrow_right)),
                      ]))),

            Divider(),

            // PLAYERS

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Gracze",
                      style: GoogleFonts.dancingScript(fontSize: 25)),
                  OutlinedButton.icon(
                      onPressed: () => Get.defaultDialog(
                            title: 'Dodaj gracza',
                            content: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    decoration: InputDecoration(
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
                                  SizedBox(height: 20),
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
                                        icon: Icon(Icons.check),
                                        label: Text('Dodaj'),
                                      ),
                                      ElevatedButton.icon(
                                        onPressed: () => Get.back(),
                                        icon: Icon(Icons.cancel_outlined),
                                        label: Text('Anuluj'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                      icon: Icon(Icons.add),
                      label: Text('Dodaj gracza')),
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
              () => Container(
                height: controller.players.length * 60.0,
                child: ReorderableListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: controller.players
                      .map((item) => ListTile(
                            key: ValueKey(item),
                            title: Text(item.name),
                            leading: item.device == Device.main
                                ? Icon(Icons.person)
                                : item.device == Device.mobile
                                    ? Icon(Icons.smartphone_outlined)
                                    : Icon(Icons.tablet),
                            trailing: IconButton(
                                onPressed: () {
                                  controller.players.remove(item);
                                },
                                icon: Icon(
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
            Divider(),

            // CHARACTERS

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Postacie",
                      style: GoogleFonts.dancingScript(fontSize: 25)),
                  OutlinedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.add),
                      label: Text('Dodaj postać')),
                ],
              ),
            ),
            for (var item in controller.characters)
              ListTile(
                title: Text(item.name),
                leading: fractionMap[item.fraction]!.image,
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
              ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child:
                  FilledButton(onPressed: () {}, child: Text('Rozpocznij grę')),
            ),
            SizedBox(height: 20),
          ],
        ));
  }
}
