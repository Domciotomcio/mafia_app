import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fraction.freezed.dart';

@freezed
abstract class Fraction with _$Fraction {
  const factory Fraction({
    required String id,
    required String name,
    required String nameId,
    required Color color,
    required String description,
    required String target,
    required String history,
    String? historicContext,
    required Widget image,
    required String imagePath,
    String? audioPath,
  }) = _Fraction;
}
