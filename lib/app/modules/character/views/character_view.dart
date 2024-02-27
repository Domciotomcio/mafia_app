import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project/app/constants/maps/additional_info.dart';
import 'package:project/app/constants/maps/fraction.dart';

import '../controllers/character_controller.dart';
import 'package:project/app/data/character/models/character.dart';

class CharacterView extends GetView<CharacterController> {
  const CharacterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Widok postaci'),
          centerTitle: true,
        ),
        body: controller.obx(
          (character) => characterLoaded(character, context),
          onLoading: const Center(
            child: CircularProgressIndicator(),
          ),
          onError: (error) => Center(
            child: Text('Wystąpił błąd: $error'),
          ),
        ));
  }

  Widget characterLoaded(Character? character, BuildContext context) {
    var fraction = fractionMap[character!.fraction]!;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Text(character!.name,
              style: Theme.of(context).textTheme.displaySmall),
          if (character.otherNames.isNotEmpty)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("znany też jako: ",
                    style: Theme.of(context).textTheme.bodySmall),
                for (var alias in character.otherNames)
                  Row(
                    children: [
                      Text(
                        alias,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      if (alias != character.otherNames.last)
                        Text(
                          ", ",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                    ],
                  ),
                // if
              ],
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: fraction.image,
              ),
              Text(
                fractionMap[character.fraction]!.name,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: fraction.image,
              ),
            ],
          ),
          const SizedBox(height: 5),
          Image.asset(
            character.imagePath ??
                'assets/images/townsfolk.jpg', // LATER TO CHANGE
          ),
          const SizedBox(height: 5),
          Text(character.quote,
              style: const TextStyle(
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(),
              descWithLabel("Opis", character.description, context),
              const Divider(),
              descWithLabel("Historia", character.story, context),
              const Divider(),
              howToPlayInfo(character.howToPlay, context),
              const Divider(),
              additionalInfo(character.additionalInfo, context),
              const Divider(),
              suitabilityLeveLinfo(character.suitabilityLevel, context),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}

Widget descWithLabel(String label, String text, BuildContext context) {
  return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 8),
          Text(text),
        ],
      ));
}

Widget suitabilityLeveLinfo(int level, BuildContext context) {
  Map<int, String> levelDesc = {
    -3: "Bardzo niekorzystny dla własnej frakcji",
    -2: "Niekorzystny dla własnej frakcji",
    -1: "Trochę niekorzystny dla własnej frakcji",
    0: "Neutralny dla własnej frakcji",
    1: "Trochę użyteczny dla własnej frakcji",
    2: "Użyteczny dla własnej frakcji",
    3: "Bardzo użyteczny dla własnej frakcji",
  };

  Map<int, Color> levelColor = {
    -3: Colors.red,
    -2: Colors.deepOrange,
    -1: Colors.orange,
    0: Colors.yellow,
    1: Colors.lightGreen,
    2: Colors.green,
    3: Colors.green,
  };

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Poziom użyteczności",
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(level.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: levelColor[level]!)),
            Text(" - ${levelDesc[level]!}"),
          ],
        ),
      ],
    ),
  );
}

Widget additionalInfo(Map<String, bool> additionalInfo, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Dodatkowe informacje",
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: additionalInfo.entries
              .map((entry) => Row(
                    children: [
                      Text(additionalInfoTranslationMap[entry.key]!),
                      entry.value
                          ? const Icon(Icons.check, color: Colors.green)
                          : const Icon(Icons.close, color: Colors.red),
                    ],
                  ))
              .toList(),
        ),
      ],
    ),
  );
}

Widget howToPlayInfo(List<String> howToPlay, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Jak grać",
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: howToPlay
              .map((entry) => Column(
                    children: [
                      Text("- " + entry),
                      SizedBox(height: 8),
                    ],
                  ))
              .toList(),
        ),
      ],
    ),
  );
}
