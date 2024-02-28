import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/enums/fraction.dart';
import '../../../data/character/models/character.dart';

class CreateCharacterController extends GetxController {
  String name = '';
  String fraction = '';
  String quote = '';
  String description = '';
  String story = '';
  int suitabilityLevel = 0;

  void createCharacter() {
    print('name: $name');
    print('fraction: $fraction');
    print('quote: $quote');
    print('description: $description');
    print('suitabilityLevel: $suitabilityLevel');
  }
}
