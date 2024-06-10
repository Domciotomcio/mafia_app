import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/app/data/character/providers/firebase_character_provider.dart';
import 'package:project/app/data/character/repositories/character_repository.dart';
import 'package:project/app/data/character/services/character_service.dart';
import 'package:project/app/data/tutorial/providers/json_tutorial_provider.dart';
import 'package:project/app/data/tutorial/repositories/tutorial_repository.dart';
import 'package:project/app/data/tutorial/services/tutorial_service.dart';
import 'package:project/app/translations/translations.dart';

import 'app/routes/app_pages.dart';
import 'app/shared/controllers/audio_controller.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await initServices();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WidgetsFlutterBinding.ensureInitialized();

  // background music
  AudioController audioController = Get.put(AudioController(),
      tag: 'backgroundAudioController', permanent: true);
  // audioController.playAudio('audio/background.mp3', loop: true, volume: 0.2);

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      themeMode: ThemeMode.dark,
      theme: ThemeData(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: Colors.black,
            titleTextStyle: GoogleFonts.dancingScript(
              fontSize: 30,
              color: Colors.white,
            ),
            shadowColor: Colors.white,
            surfaceTintColor: Colors.black,
            elevation: 4,
          ),
          colorScheme: const ColorScheme.highContrastDark(
            primary: Color.fromARGB(255, 255, 255, 255),
            secondary: Colors.green,
            surface: Colors.black,
            inverseSurface: Colors.white,
          )),
      translations: Messages(),
      //locale: Locale('pl', 'PL'),
      locale: const Locale('pl', 'PL'),
      //fallbackLocale: Locale('en', 'US'),
    ),
  );
}

Future<void> initServices() async {
  await Get.putAsync(() => CharacterService(
          characterRepository: CharacterRepository(
              characterProvider: FirebaseCharacterProvider()))
      .init());

  await Get.putAsync(() => TutorialService(
          tutorialRepository: TutorialRepository(
              tutorialProvider: JsonTutorialProvider(
                  jsonPath: r'assets/tutorial/tutorial.json')))
      .init());
}
