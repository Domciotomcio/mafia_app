import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project/app/data/character/providers/firebase_character_provider.dart';
import 'package:project/app/data/character/providers/mock_character_provider.dart';
import 'package:project/app/data/character/repositories/character_repository.dart';
import 'package:project/app/data/character/services/character_service.dart';

import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await initServices();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      themeMode: ThemeMode.dark,
      theme: ThemeData(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
    ),
  );
}

Future<void> initServices() async {
  await Get.putAsync(() => CharacterService(
          characterRepository: CharacterRepository(
              characterProvider: FirebaseCharacterProvider()))
      .init());
}
