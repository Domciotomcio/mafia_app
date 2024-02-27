import 'package:flutter/material.dart';

import '../enums/fraction.dart' as fraction_enum;
import '../../data/fraction/models/fraction.dart' as fraction_model;

Map<fraction_enum.Fraction, fraction_model.Fraction> fractionMap = {
  fraction_enum.Fraction.mafia: fraction_model.Fraction(
    name: 'Mafia',
    color: const Color(0x0000ff00),
    description:
        'Zadaniem mafii jest wyeliminowanie wszystkich członków miasteczka.',
    image: Image.asset(
      'assets/icons/spade.png',
      height: 20,
      color: Colors.black,
    ),
  ),
  fraction_enum.Fraction.townsfolk: fraction_model.Fraction(
    name: 'Miasteczko',
    color: const Color(0xFFFF0000),
    description:
        'Zadaniem miasteczka jest wyeliminowanie wszystkich członków mafii.',
    image: Image.asset(
      'assets/icons/heart.png',
      height: 20,
      color: const Color(0xFFFF0000),
    ),
  ),
  fraction_enum.Fraction.sindicate: fraction_model.Fraction(
    name: 'Syndykat',
    color: const Color(0x0000ff00),
    description:
        'Zadaniem syndykatu jest wyeliminowanie wszystkich członków miasteczka.',
    image: Image.asset(
      'assets/icons/diamond.png',
      scale: 3,
      color: const Color(0x000000ff),
    ),
  ),
  fraction_enum.Fraction.redMafia: fraction_model.Fraction(
    name: 'Czerwona Mafia',
    color: const Color(0xFFFF0000),
    description:
        'Zadaniem czerwonej mafii jest wyeliminowanie wszystkich członków miasteczka.',
    image: Image.asset(
      'assets/icons/heart.png',
      scale: 3,
      color: const Color(0xFFFF0000),
    ),
  ),
};
