// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterImpl _$$CharacterImplFromJson(Map<String, dynamic> json) =>
    _$CharacterImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      nameId: json['nameId'] as String,
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
      audioPath: json['audioPath'] as String?,
    );

Map<String, dynamic> _$$CharacterImplToJson(_$CharacterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameId': instance.nameId,
      'description': instance.description,
      'story': instance.story,
      'quote': instance.quote,
      'fraction': _$FractionEnumMap[instance.fraction]!,
      'additionalInfo': instance.additionalInfo,
      'howToPlay': instance.howToPlay,
      'otherNames': instance.otherNames,
      'rate': instance.rate,
      'imagePath': instance.imagePath,
      'audioPath': instance.audioPath,
    };

const _$FractionEnumMap = {
  Fraction.mafia: 'mafia',
  Fraction.townsfolk: 'townsfolk',
  Fraction.sindicate: 'sindicate',
  Fraction.redMafia: 'redMafia',
};
