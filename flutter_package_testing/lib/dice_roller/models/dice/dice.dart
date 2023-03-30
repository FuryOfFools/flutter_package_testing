import 'package:freezed_annotation/freezed_annotation.dart';
part 'dice.freezed.dart';

@freezed
class Dice with _$Dice {
  factory Dice({
    required int maxValue,
    required int value,
  }) = _Dice;
}
