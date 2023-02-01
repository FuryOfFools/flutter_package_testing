import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dice_model.g.dart';
part 'dice_model.freezed.dart';

enum DiceType { d4, d6, d8, d10, d12, d20 }

const Map<DiceType, int> maxValueByType = {
  DiceType.d4: 4,
  DiceType.d6: 6,
  DiceType.d8: 8,
  DiceType.d10: 10,
  DiceType.d12: 12,
  DiceType.d20: 20
};

@freezed
class Dice with _$Dice {
  factory Dice({
    required DiceType type,
    required int value,
  }) = _Dice;
}

@riverpod
class DiceBoard extends _$DiceBoard {
  @override
  List<Dice> build() {
    return [];
  }

  void roll(DiceType type) {
    var rng = Random();
    state = [
      ...state,
      Dice(
        type: type,
        value: rng.nextInt(maxValueByType[type]! - 1) + 1,
      ),
    ];
  }

  void reroll(int index) {
    var rng = Random();
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          state[i].copyWith(
            value: rng.nextInt(
                  maxValueByType[state[i].type]! - 1,
                ) +
                1,
          )
        else
          state[i],
    ];
  }

  void deleteDice(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i != index) state[i]
    ];
  }

  void deleteAll() {
    state = [];
  }
}

@riverpod
int getDiceSum(GetDiceSumRef ref) {
  final dices = ref.watch(diceBoardProvider);
  int sum = 0;
  for (var element in dices) {
    sum += element.value;
  }
  return sum;
}

final modProvider = StateProvider<int>(
  (ref) => 0,
);
