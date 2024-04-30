// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tutorial.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Tutorial {
  String get language => throw _privateConstructorUsedError;
  List<Chapter> get chapters => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TutorialCopyWith<Tutorial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TutorialCopyWith<$Res> {
  factory $TutorialCopyWith(Tutorial value, $Res Function(Tutorial) then) =
      _$TutorialCopyWithImpl<$Res, Tutorial>;
  @useResult
  $Res call({String language, List<Chapter> chapters});
}

/// @nodoc
class _$TutorialCopyWithImpl<$Res, $Val extends Tutorial>
    implements $TutorialCopyWith<$Res> {
  _$TutorialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
    Object? chapters = null,
  }) {
    return _then(_value.copyWith(
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      chapters: null == chapters
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<Chapter>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TutorialImplCopyWith<$Res>
    implements $TutorialCopyWith<$Res> {
  factory _$$TutorialImplCopyWith(
          _$TutorialImpl value, $Res Function(_$TutorialImpl) then) =
      __$$TutorialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String language, List<Chapter> chapters});
}

/// @nodoc
class __$$TutorialImplCopyWithImpl<$Res>
    extends _$TutorialCopyWithImpl<$Res, _$TutorialImpl>
    implements _$$TutorialImplCopyWith<$Res> {
  __$$TutorialImplCopyWithImpl(
      _$TutorialImpl _value, $Res Function(_$TutorialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
    Object? chapters = null,
  }) {
    return _then(_$TutorialImpl(
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      chapters: null == chapters
          ? _value._chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<Chapter>,
    ));
  }
}

/// @nodoc

class _$TutorialImpl implements _Tutorial {
  const _$TutorialImpl(
      {required this.language, required final List<Chapter> chapters})
      : _chapters = chapters;

  @override
  final String language;
  final List<Chapter> _chapters;
  @override
  List<Chapter> get chapters {
    if (_chapters is EqualUnmodifiableListView) return _chapters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chapters);
  }

  @override
  String toString() {
    return 'Tutorial(language: $language, chapters: $chapters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TutorialImpl &&
            (identical(other.language, language) ||
                other.language == language) &&
            const DeepCollectionEquality().equals(other._chapters, _chapters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, language, const DeepCollectionEquality().hash(_chapters));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TutorialImplCopyWith<_$TutorialImpl> get copyWith =>
      __$$TutorialImplCopyWithImpl<_$TutorialImpl>(this, _$identity);
}

abstract class _Tutorial implements Tutorial {
  const factory _Tutorial(
      {required final String language,
      required final List<Chapter> chapters}) = _$TutorialImpl;

  @override
  String get language;
  @override
  List<Chapter> get chapters;
  @override
  @JsonKey(ignore: true)
  _$$TutorialImplCopyWith<_$TutorialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
