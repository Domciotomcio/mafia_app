import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/app/constants/maps/additional_info.dart';
import 'package:project/app/constants/maps/fraction.dart';

import '../../../constants/maps/character_rate.dart';
import '../controllers/character_controller.dart';
import 'package:project/app/data/character/models/character.dart';

class CharacterView extends GetView<CharacterController> {
  const CharacterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var character = Get.arguments['id'] as Character;
    return Scaffold(
      body: characterLoaded(character, context),
      backgroundColor: Color.fromARGB(172, 0, 0, 0),
    );
    // body: controller.obx(
    //   (character) => characterLoaded(character, context),
    //   onLoading: const Center(
    //     child: CircularProgressIndicator(),
    //   ),
    //   onError: (error) => Center(
    //     child: Text('Wystąpił błąd: $error'),
    //   ),
    // ));
  }

  Widget characterLoaded(Character? character, BuildContext context) {
    var fraction = fractionMap[character!.fraction]!;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        character.imagePath ?? 'assets/images/townsfolk.jpg',
                        //color: Colors.black.withOpacity(0.6),
                        colorBlendMode: BlendMode.darken,
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          height: 150.0, // Height of the gradient
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Color.fromARGB(255, 0, 0, 0),
                                Colors.transparent
                              ],
                            ),
                          ),
                        ).animate().fadeIn(
                            delay: Duration(seconds: 0),
                            duration: Duration(seconds: 1)),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      character.name,
                      style: GoogleFonts.dancingScript(
                        fontSize: 60,
                      ),
                      textAlign: TextAlign.center,
                    ).animate().fadeIn(
                        delay: Duration(milliseconds: 1500),
                        duration: Duration(seconds: 1)),
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.arrow_back),
                        iconSize: 30,
                        color: Colors.white,
                      ),
                      FilledButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.black.withOpacity(0.5),
                        ),
                        child: Row(
                          children: [
                            Text(fraction.name,
                                    style: GoogleFonts.dancingScript(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ))
                                .animate()
                                .fadeIn(
                                    delay: Duration(seconds: 3),
                                    duration: Duration(seconds: 1)),
                            const SizedBox(width: 10),
                            fraction.image.animate().fadeIn(
                                delay: Duration(seconds: 3),
                                duration: Duration(seconds: 1)),
                          ],
                        ),
                      ).animate().fadeIn(
                          delay: Duration(seconds: 3),
                          duration: Duration(seconds: 1)),
                    ],
                  )),
            ],
          ),
          // const SizedBox(height: 20),
          // Text(character.name, style: Theme.of(context).textTheme.displaySmall),
          // // style: GoogleFonts.dancingScript(
          // //   fontSize: 60,
          // // )),
          // if (character.otherNames.isNotEmpty)
          //   Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Text("znany też jako: ",
          //           style: Theme.of(context).textTheme.bodySmall?.copyWith(
          //                 fontStyle: FontStyle.italic,
          //               )),
          //       for (var alias in character.otherNames)
          //         Row(
          //           children: [
          //             Text(alias,
          //                 style:
          //                     Theme.of(context).textTheme.bodySmall?.copyWith(
          //                           fontStyle: FontStyle.italic,
          //                           fontWeight: FontWeight.bold,
          //                         )),
          //             if (alias != character.otherNames.last)
          //               Text(", ",
          //                   style:
          //                       Theme.of(context).textTheme.bodySmall?.copyWith(
          //                             fontStyle: FontStyle.italic,
          //                           )),
          //           ],
          //         ),
          //       // if
          //     ],
          //   ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: fraction.image,
          //     ),
          //     Text(
          //       fractionMap[character.fraction]!.name,
          //       style: Theme.of(context).textTheme.labelLarge,
          //       // style: GoogleFonts.dancingScript(
          //       //   fontSize: 18,
          //       // ),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: fraction.image,
          //     ),
          //   ],
          // ),
          const SizedBox(height: 5),
          // Hero(
          //   tag: character.id,
          //   child: Image.asset(
          //     character.imagePath ??
          //         'assets/images/townsfolk.jpg', // LATER TO CHANGE
          //   ),
          // ),
          const SizedBox(height: 5),
          // Text(character.quote,
          //     style: const TextStyle(
          //       fontStyle: FontStyle.italic,
          //     ),
          //     // style: GoogleFonts.dancingScript(
          //     //   fontSize: 20,
          //     // ),
          //     textAlign: TextAlign.center),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              descWithLabel("Opis", character.description, context),
              const Divider(),
              descWithLabel("Historia", character.story, context),
              const Divider(),
              if (character.howToPlay.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    howToPlayInfo(character.howToPlay, context),
                    const Divider(),
                  ],
                ),
              if (character.additionalInfo.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    additionalInfo(character.additionalInfo, context),
                    const Divider(),
                  ],
                ),
              characterRate(character.rate, context),
              const Divider(),
              const SizedBox(height: 10),
              Center(child: characterQuote(character.quote, context)),
              const SizedBox(height: 10),
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
            //style: Theme.of(context).textTheme.labelLarge,
            style: GoogleFonts.dancingScript(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 8),
          AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(
                text,
                textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                speed: const Duration(milliseconds: 30),
              ),
            ],
            isRepeatingAnimation: false,
            displayFullTextOnTap: true,
          ),
        ],
      ));
}

Widget characterRate(Map<String, int> rates, BuildContext context) {
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
    1: Colors.deepOrange,
    2: Colors.orange,
    3: Colors.yellow,
    4: Colors.lightGreen,
    5: Colors.green,
  };

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Ocena",
          // style: Theme.of(context).textTheme.labelLarge,
          style: GoogleFonts.dancingScript(
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 8),
        for (var rate in rates.entries)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("${characterRateTranslationMap[rate.key]}",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontStyle: FontStyle.italic,
                      )),
              const SizedBox(width: 12),
              Text(rate.value.toString(),
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: levelColor[rate.value]!)),
              Text(
                "/5",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
              ),
            ],
          ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: [
        //     Text(level.toString(),
        //         style: TextStyle(
        //             fontSize: 18,
        //             fontWeight: FontWeight.bold,
        //             color: levelColor[level]!)),
        //     Text(" - ${levelDesc[level]!}",
        //         style: Theme.of(context).textTheme.bodySmall?.copyWith(
        //               fontStyle: FontStyle.italic,
        //             )),
        //   ],
        // ),
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
          // style: Theme.of(context).textTheme.labelLarge,
          style: GoogleFonts.dancingScript(
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: additionalInfo.entries
              .map((entry) => Row(
                    children: [
                      Text(additionalInfoTranslationMap[entry.key]!,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontStyle: FontStyle.italic)),
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
          // style: Theme.of(context).textTheme.labelLarge,
          style: GoogleFonts.dancingScript(
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 8),
        AnimatedTextKit(
          animatedTexts: [
            for (String s in howToPlay)
              TyperAnimatedText(
                s,
                textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                speed: const Duration(milliseconds: 30),
              ),
          ],
          pause: Duration(seconds: 4),
        ),
        // const SizedBox(height: 8),
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: howToPlay
        //       .map((entry) => Column(
        //             children: [
        //               Text("- " + entry,
        //                   style:
        //                       Theme.of(context).textTheme.bodySmall?.copyWith(
        //                             fontStyle: FontStyle.italic,
        //                           )),
        //               SizedBox(height: 8),
        //             ],
        //           ))
        //       .toList(),
        // ),
      ],
    ),
  );
}

Widget characterQuote(String quote, BuildContext context) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '"' + quote + '"',
            style: GoogleFonts.dancingScript(
              fontSize: 25,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}
