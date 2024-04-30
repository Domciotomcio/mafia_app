// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutorial.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TutorialImpl _$$TutorialImplFromJson(Map<String, dynamic> json) =>
    _$TutorialImpl(
      id: json['id'] as String,
      language: json['language'] as String,
      chapters: (json['chapters'] as List<dynamic>)
          .map((e) => Chapter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TutorialImplToJson(_$TutorialImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'language': instance.language,
      'chapters': instance.chapters,
    };
