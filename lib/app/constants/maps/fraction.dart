import 'package:flutter/material.dart';

import '../enums/fraction.dart' as fraction_enum;
import '../../data/fraction/models/fraction.dart' as fraction_model;

Map<fraction_enum.Fraction, fraction_model.Fraction> fractionMap = {
  fraction_enum.Fraction.mafia: fraction_model.Fraction(
      id: '1',
      name: 'Mafia',
      nameId: 'mafia',
      color: const Color.fromARGB(255, 29, 45, 66),
      description:
          "Frakcja Mafia w grze towarzyskiej Mafia to grupa graczy, którzy współpracują ze sobą, aby wyeliminować wszystkich innych uczestników gry, szczególnie członków frakcji miasta",
      history:
          "Nazywamy się La Famiglia, i jesteśmy siłą, która rządzi tym miastem z cienia. Nasza mafia powstała, by przejąć władzę i utrzymać ją za wszelką cenę. Działamy w mroku, gdzie nasze ruchy są niewidoczne, a nasze plany skrupulatnie realizowane. Każdy z nas zna swoją rolę, a zaufanie jest fundamentem naszej organizacji.\n\n"
          "Każdej nocy spotykamy się w skryciu, planując kolejne ruchy. Nasze twarze są znane tylko sobie nawzajem; musimy działać tak, by nikt z zewnątrz nie mógł nas zidentyfikować. Każdy z nas ma swoje zadania – jedni likwidują wrogów, inni zbierają potrzebne informacje, a jeszcze inni do końca skrywają się w cieniu.\n\n"
          "Każde spotkanie jest pełne napięcia i emocji. Każdy ruch musi być przemyślany, każda decyzja dokładnie przeanalizowana. Wiemy, że tylko dzięki naszej dyscyplinie i lojalności możemy utrzymać władzę i uniknąć wykrycia.\n\n"
          "Każdego ranka wracamy do naszych codziennych zadań, ukrywając się na widoku. Mieszkańcy miasta mogą nie wiedzieć, kim jesteśmy, ale czują nasz wpływ na każdym kroku. Jesteśmy La Famiglia, niewidzialna siła, która rządzi tym miastem, a nasz cel jest jasny – utrzymać władzę za wszelką cenę.",
      historicContext: '',
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
      audioPath: 'fractions/Mafia.mp3'),
  fraction_enum.Fraction.townsfolk: fraction_model.Fraction(
      id: '2',
      name: 'Miasteczko',
      nameId: 'townsfolk',
      color: const Color.fromARGB(255, 245, 90, 0),
      description:
          'Zadaniem miasteczka jest wyeliminowanie wszystkich członków mafii.',
      history:
          "Jesteśmy mieszkańcami tego miasta, zjednoczonymi w walce o nasze życie i przyszłość. Przez lata cierpieliśmy pod jarzmem mafii, która rządzi w cieniu, siejąc strach i przemoc. Ale teraz nadszedł czas, aby odzyskać nasze miasto.\n\n"
          "Każdego dnia zbieramy się, planując nasze działania - kogo sprawdzić, a kogo wyeliminować. Każdy z nas ma swoje zadanie – nasz detektyw już depcze po piętach mafii, a jeszcze inni organizują pomoc dla tych, którzy zostali przez nią poszkodowani. Naszym nadrzędnym celem jest wyeliminowanie mafii, kawałek po kawałku.\n\n"
          "Każdego wieczoru wracamy do naszych domów, do naszych rodzin, z poczuciem, że zrobiliśmy coś ważnego. Nie możemy spocząć na laurach – zaczyna się noc. Ale jesteśmy mieszkańcami tego miasta, i nie zatrzymamy się, dopóki mafia nie zostanie wyeliminowana. Razem jesteśmy silniejsi, razem odzyskamy nasze miasto.\n\n",
      historicContext: '',
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
      audioPath: 'fractions/Miasteczko.mp3'),
  fraction_enum.Fraction.sindicate: fraction_model.Fraction(
    id: '3',
    name: 'Syndykat',
    nameId: 'sindicate',
    color: const Color.fromARGB(255, 1, 10, 143),
    description:
        'Zadaniem syndykatu jest wyeliminowanie wszystkich członków miasteczka.',
    history:
        "Syndykaty przestępcze zaczęły się formować w XIX i na początku XX wieku, głównie jako reakcja na społeczne i ekonomiczne zmiany zachodzące w różnych krajach. Powstawały tam, gdzie istniały luki w prawie lub gdzie panowała korupcja, umożliwiając im rozwój i działalność na szeroką skalę.",
    historicContext: '',
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
    nameId: 'red_mafia',
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
