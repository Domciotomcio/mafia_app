import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/app/constants/maps/additional_info.dart';
import 'package:project/app/constants/maps/fraction.dart';
import 'package:project/app/shared/widgets/main_image_widget.dart';

import '../../../constants/maps/character_rate.dart';
import '../../../shared/widgets/desc_with_label.dart';
import '../controllers/character_controller.dart';
import 'package:project/app/data/character/models/character.dart';

class CharacterView extends GetView<CharacterController> {
  CharacterView({Key? key}) : super(key: key);

  final ScrollControllerWithGetX scrollControllerWithGetX =
      Get.put(ScrollControllerWithGetX());

  @override
  Widget build(BuildContext context) {
    var character = Get.arguments['id'] as Character;
    return Scaffold(
      body: characterLoaded(character, context),
      backgroundColor: const Color.fromARGB(172, 0, 0, 0),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //
        },
        child: const Icon(Icons.play_arrow_outlined),
      ),
    );
  }

  Widget characterLoaded(Character? character, BuildContext context) {
    var fraction = fractionMap[character!.fraction]!;

    return Container(
      //color: Color.fromARGB(255, 132, 255, 0),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(character.imagePath),
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken),
        ),
      ),
      child: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollControllerWithGetX.scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MainImageWidget(
                    imagePath: character.imagePath, name: character.name),
                //CharacterImageSection(character: character),
                //const SizedBox(height: 5),
                Container(
                  color: Colors.black,
                  child: CharacterInfoSection(character: character)
                      .animate()
                      .fadeIn(
                          delay: const Duration(milliseconds: 1000),
                          duration: const Duration(seconds: 1)),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          Obx(
            () => Container(
              alignment: Alignment.topCenter,
              height: 140,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(
                        (Get.find<ScrollControllerWithGetX>()
                                    .scrollPosition
                                    .value /
                                200)
                            .clamp(0.0, 1.0)),
                    Colors.transparent,
                  ],
                ),
              ),
              child: NavigationAndFractionSection(
                character: character,
                scrollControllerWithGetX: scrollControllerWithGetX,
              ).animate().fadeIn(
                  delay: const Duration(milliseconds: 1000),
                  duration: const Duration(seconds: 1)),
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationAndFractionSection extends StatelessWidget {
  final Character character;
  final ScrollControllerWithGetX scrollControllerWithGetX;

  const NavigationAndFractionSection(
      {super.key,
      required this.character,
      required this.scrollControllerWithGetX});

  @override
  Widget build(BuildContext context) {
    var fraction = fractionMap[character.fraction]!;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 0.1,
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back),
              iconSize: 30,
              color: Colors.white,
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              boxShadow: [
                BoxShadow(
                  color: fraction.color.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 30,
                  offset: const Offset(0, 3),
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.7),
                  spreadRadius: 10,
                  blurRadius: 30,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Text(
                  fraction.name,
                  style: GoogleFonts.dancingScript(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                fraction.image,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CharacterInfoSection extends StatelessWidget {
  final Character character;

  const CharacterInfoSection({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DescWithLabel(label: "Opis", description: character.description),
        const Divider(),
        DescWithLabel(label: "Historia", description: character.story),
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
    );
  }
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
          pause: const Duration(seconds: 4),
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
      child: AnimatedTextKit(
        animatedTexts: [
          TyperAnimatedText(
            '"' + quote + '"',
            textStyle: GoogleFonts.dancingScript(
              fontSize: 25,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
            speed: const Duration(milliseconds: 100),
          ),
        ],
        totalRepeatCount: 1,
      ),
    ),
  );
}

class ScrollControllerWithGetX extends GetxController {
  final ScrollController scrollController = ScrollController();
  final RxDouble scrollPosition = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_updateScrollPosition);
  }

  @override
  void onClose() {
    scrollController.removeListener(_updateScrollPosition);
    scrollController.dispose();
    super.onClose();
  }

  void _updateScrollPosition() {
    scrollPosition.value = scrollController.position.pixels;
    print(scrollPosition.value);
  }
}
