// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dice_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Dice {
  DiceType get type => throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DiceCopyWith<Dice> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiceCopyWith<$Res> {
  factory $DiceCopyWith(Dice value, $Res Function(Dice) then) =
      _$DiceCopyWithImpl<$Res, Dice>;
  @useResult
  $Res call({DiceType type, int value});
}

/// @nodoc
class _$DiceCopyWithImpl<$Res, $Val extends Dice>
    implements $DiceCopyWith<$Res> {
  _$DiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DiceType,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DiceCopyWith<$Res> implements $DiceCopyWith<$Res> {
  factory _$$_DiceCopyWith(_$_Dice value, $Res Function(_$_Dice) then) =
      __$$_DiceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DiceType type, int value});
}

/// @nodoc
class __$$_DiceCopyWithImpl<$Res> extends _$DiceCopyWithImpl<$Res, _$_Dice>
    implements _$$_DiceCopyWith<$Res> {
  __$$_DiceCopyWithImpl(_$_Dice _value, $Res Function(_$_Dice) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? value = null,
  }) {
    return _then(_$_Dice(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DiceType,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Dice implements _Dice {
  _$_Dice({required this.type, required this.value});

  @override
  final DiceType type;
  @override
  final int value;

  @override
  String toString() {
    return 'Dice(type: $type, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Dice &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiceCopyWith<_$_Dice> get copyWith =>
      __$$_DiceCopyWithImpl<_$_Dice>(this, _$identity);
}

abstract class _Dice implements Dice {
  factory _Dice({required final DiceType type, required final int value}) =
      _$_Dice;

  @override
  DiceType get type;
  @override
  int get value;
  @override
  @JsonKey(ignore: true)
  _$$_DiceCopyWith<_$_Dice> get copyWith => throw _privateConstructorUsedError;
}
