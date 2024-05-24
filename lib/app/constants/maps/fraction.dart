import 'package:flutter/material.dart';

import '../enums/fraction.dart' as fraction_enum;
import '../../data/fraction/models/fraction.dart' as fraction_model;

Map<fraction_enum.Fraction, fraction_model.Fraction> fractionMap = {
  fraction_enum.Fraction.mafia: fraction_model.Fraction(
    id: '1',
    name: 'Mafia',
    color: const Color.fromARGB(255, 29, 45, 66),
    description:
        "Frakcja Mafia w grze towarzyskiej Mafia to grupa graczy, którzy współpracują ze sobą, aby wyeliminować wszystkich innych uczestników gry, szczególnie członków frakcji miasta",
    history:
        "Mafia, znana również jako Cosa Nostra, wywodzi się z Sycylii, gdzie swoje korzenie ma w XIX wieku. Początkowo była to grupa społeczna, która broniła interesów lokalnych rolników i właścicieli ziemskich przed niesprawiedliwością i nadużyciami władz. W miarę upływu czasu, organizacja ta zaczęła stosować przemoc i zastraszanie, aby osiągać swoje cele.",
    target: 'Wyeliminuj wszystkich członków miasteczka.',
    image: Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 184, 184, 184).withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Image.asset(
        'assets/icons/spade.png',
        height: 30,
        color: const Color.fromARGB(255, 0, 0, 0),
      ),
    ),
    imagePath: 'assets/images/fractions/mafia.jpg',
  ),
  fraction_enum.Fraction.townsfolk: fraction_model.Fraction(
    id: '2',
    name: 'Miasteczko',
    color: const Color.fromARGB(255, 245, 90, 0),
    description:
        'Zadaniem miasteczka jest wyeliminowanie wszystkich członków mafii.',
    history:
        "Już od początków istnienia mafii na Sycylii, istnieli ludzie, którzy przeciwstawiali się jej brutalnym rządom. Byli to głównie miejscowi rolnicy i przedsiębiorcy, którzy odmawiali płacenia haraczy i podporządkowania się mafii. Niestety, często kończyli oni jako ofiary mafijnych egzekucji.",
    target: "Wyeliminuj wszystkich członków mafii.",
    image: Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 167, 167, 167).withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Image.asset(
        'assets/icons/heart.png',
        height: 30,
        color: const Color.fromARGB(255, 182, 0, 0),
      ),
    ),
    imagePath: 'assets/images/fractions/townsfolk.jpg',
  ),
  fraction_enum.Fraction.sindicate: fraction_model.Fraction(
    id: '3',
    name: 'Syndykat',
    color: const Color.fromARGB(255, 1, 10, 143),
    description:
        'Zadaniem syndykatu jest wyeliminowanie wszystkich członków miasteczka.',
    history:
        "Syndykaty przestępcze zaczęły się formować w XIX i na początku XX wieku, głównie jako reakcja na społeczne i ekonomiczne zmiany zachodzące w różnych krajach. Powstawały tam, gdzie istniały luki w prawie lub gdzie panowała korupcja, umożliwiając im rozwój i działalność na szeroką skalę.",
    target: 'Wyeliminuj wszystkich członków miasteczka.',
    image: Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 167, 167, 167).withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Image.asset(
        'assets/icons/club.png',
        height: 30,
        color: const Color.fromARGB(255, 0, 0, 0),
      ),
    ),
    imagePath: 'assets/images/fractions/sindicate.jpg',
  ),
  fraction_enum.Fraction.redMafia: fraction_model.Fraction(
    id: '4',
    name: 'Czerwona Mafia',
    color: const Color.fromARGB(255, 150, 1, 1),
    description:
        'Zadaniem czerwonej mafii jest wyeliminowanie wszystkich członków miasteczka.',
    history:
        "Czerwona Mafia powstała w Rosji w latach 20. XX wieku jako organizacja przestępcza, która działała na terenie całego kraju. Jej celem było walka z władzą sowiecką i obalenie jej, aby przejąć kontrolę nad krajem. W tym celu czerwona mafia stosowała przemoc i zastraszanie, aby osiągnąć swoje cele.",
    target: 'Wyeliminuj wszystkich członków miasteczka.',
    image: Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 167, 167, 167).withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Image.asset(
        'assets/icons/diamond.png',
        height: 30,
        color: const Color.fromARGB(255, 150, 1, 1),
      ),
    ),
    imagePath: 'assets/images/fractions/mafia.jpg',
  ),
};
