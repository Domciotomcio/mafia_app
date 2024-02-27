import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../constants/enums/fraction.dart';

part 'character.freezed.dart';
part 'character.g.dart';

@freezed
class Character with _$Character {
  const factory Character({
    required String id,
    required String name,
    required String description,
    required String story,
    required String quote,
    required Fraction fraction,
    required Map<String, bool> additionalInfo,
    required List<String> howToPlay,
    required List<String> otherNames,
    required int
        suitabilityLevel, // how useful is the character to the faction, -3 to 3
    required String imagePath,
  }) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}
