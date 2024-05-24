import 'package:flutter/material.dart';

import '../enums/fraction.dart' as fraction_enum;
import '../../data/fraction/models/fraction.dart' as fraction_model;

Map<fraction_enum.Fraction, fraction_model.Fraction> fractionMap = {
  fraction_enum.Fraction.mafia: fraction_model.Fraction(
    name: 'Mafia',
    color: const Color.fromARGB(255, 29, 45, 66),
    description:
        'Zadaniem mafii jest wyeliminowanie wszystkich członków miasteczka.',
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
    name: 'Miasteczko',
    color: const Color.fromARGB(255, 245, 90, 0),
    description:
        'Zadaniem miasteczka jest wyeliminowanie wszystkich członków mafii.',
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
    name: 'Syndykat',
    color: const Color.fromARGB(255, 1, 10, 143),
    description:
        'Zadaniem syndykatu jest wyeliminowanie wszystkich członków miasteczka.',
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
    name: 'Czerwona Mafia',
    color: const Color.fromARGB(255, 150, 1, 1),
    description:
        'Zadaniem czerwonej mafii jest wyeliminowanie wszystkich członków miasteczka.',
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
