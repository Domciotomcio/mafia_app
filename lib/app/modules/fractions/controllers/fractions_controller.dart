import 'package:get/get.dart';

import '../../../constants/enums/fraction.dart';
import '../../../constants/maps/fraction.dart';

class FractionsController extends GetxController {
  var fractions = [
    fractionMap[Fraction.mafia],
    fractionMap[Fraction.townsfolk],
    fractionMap[Fraction.sindicate],
    fractionMap[Fraction.redMafia],
  ];
}
