import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fraction.freezed.dart';

@freezed
abstract class Fraction with _$Fraction {
  const factory Fraction({
    required String name,
    required Color color,
    required String description,
    required Widget image,
  }) = _Fraction;
}
