// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fraction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Fraction {
  String get name => throw _privateConstructorUsedError;
  Color get color => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Widget get image => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FractionCopyWith<Fraction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FractionCopyWith<$Res> {
  factory $FractionCopyWith(Fraction value, $Res Function(Fraction) then) =
      _$FractionCopyWithImpl<$Res, Fraction>;
  @useResult
  $Res call(
      {String name,
      Color color,
      String description,
      Widget image,
      String imagePath});
}

/// @nodoc
class _$FractionCopyWithImpl<$Res, $Val extends Fraction>
    implements $FractionCopyWith<$Res> {
  _$FractionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? color = null,
    Object? description = null,
    Object? image = null,
    Object? imagePath = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Widget,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FractionImplCopyWith<$Res>
    implements $FractionCopyWith<$Res> {
  factory _$$FractionImplCopyWith(
          _$FractionImpl value, $Res Function(_$FractionImpl) then) =
      __$$FractionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      Color color,
      String description,
      Widget image,
      String imagePath});
}

/// @nodoc
class __$$FractionImplCopyWithImpl<$Res>
    extends _$FractionCopyWithImpl<$Res, _$FractionImpl>
    implements _$$FractionImplCopyWith<$Res> {
  __$$FractionImplCopyWithImpl(
      _$FractionImpl _value, $Res Function(_$FractionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? color = null,
    Object? description = null,
    Object? image = null,
    Object? imagePath = null,
  }) {
    return _then(_$FractionImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Widget,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FractionImpl implements _Fraction {
  const _$FractionImpl(
      {required this.name,
      required this.color,
      required this.description,
      required this.image,
      required this.imagePath});

  @override
  final String name;
  @override
  final Color color;
  @override
  final String description;
  @override
  final Widget image;
  @override
  final String imagePath;

  @override
  String toString() {
    return 'Fraction(name: $name, color: $color, description: $description, image: $image, imagePath: $imagePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FractionImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, color, description, image, imagePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FractionImplCopyWith<_$FractionImpl> get copyWith =>
      __$$FractionImplCopyWithImpl<_$FractionImpl>(this, _$identity);
}

abstract class _Fraction implements Fraction {
  const factory _Fraction(
      {required final String name,
      required final Color color,
      required final String description,
      required final Widget image,
      required final String imagePath}) = _$FractionImpl;

  @override
  String get name;
  @override
  Color get color;
  @override
  String get description;
  @override
  Widget get image;
  @override
  String get imagePath;
  @override
  @JsonKey(ignore: true)
  _$$FractionImplCopyWith<_$FractionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
