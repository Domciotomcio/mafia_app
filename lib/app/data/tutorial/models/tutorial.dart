import 'package:freezed_annotation/freezed_annotation.dart';

import 'chapter.dart';

part 'tutorial.freezed.dart';

@freezed
abstract class Tutorial with _$Tutorial {
  const factory Tutorial({
    required String language,
    required List<Chapter> chapters,
  }) = _Tutorial;
}
