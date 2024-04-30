import 'package:freezed_annotation/freezed_annotation.dart';

import 'chapter.dart';

part 'tutorial.freezed.dart';
part 'tutorial.g.dart';

@freezed
abstract class Tutorial with _$Tutorial {
  const factory Tutorial({
    required String id,
    required String language,
    required List<Chapter> chapters,
  }) = _Tutorial;

  factory Tutorial.fromJson(Map<String, dynamic> json) =>
      _$TutorialFromJson(json);
}
