import 'package:project/app/data/character/models/character.dart';

List<Character> sortByName(List<Character> characters) {
  return characters..sort((a, b) => a.name.compareTo(b.name));
}
