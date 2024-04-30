import 'package:freezed_annotation/freezed_annotation.dart';

part 'chapter.freezed.dart';

@freezed
abstract class Chapter with _$Chapter {
  const factory Chapter({
    required String label,
    required String text,
  }) = _Chapter;
}
