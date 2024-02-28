// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterImpl _$$CharacterImplFromJson(Map<String, dynamic> json) =>
    _$CharacterImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      story: json['story'] as String,
      quote: json['quote'] as String,
      fraction: $enumDecode(_$FractionEnumMap, json['fraction']),
      additionalInfo: Map<String, bool>.from(json['additionalInfo'] as Map),
      howToPlay:
          (json['howToPlay'] as List<dynamic>).map((e) => e as String).toList(),
      otherNames: (json['otherNames'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      rate: Map<String, int>.from(json['rate'] as Map),
      imagePath: json['imagePath'] as String,
    );

Map<String, dynamic> _$$CharacterImplToJson(_$CharacterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'story': instance.story,
      'quote': instance.quote,
      'fraction': _$FractionEnumMap[instance.fraction]!,
      'additionalInfo': instance.additionalInfo,
      'howToPlay': instance.howToPlay,
      'otherNames': instance.otherNames,
      'rate': instance.rate,
      'imagePath': instance.imagePath,
    };

const _$FractionEnumMap = {
  Fraction.mafia: 'mafia',
  Fraction.townsfolk: 'townsfolk',
  Fraction.sindicate: 'sindicate',
  Fraction.redMafia: 'redMafia',
};
