import 'dart:math';

import 'package:flutter_package_testing/dice_roller/models/dice/dice.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dice_board.g.dart';

@riverpod
class DiceBoard extends _$DiceBoard {
  @override
  List<Dice> build() {
    return [];
  }

  void reroll(int index) {
    var rng = Random();
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          state[i].copyWith(
            value: rng.nextInt(state[i].maxValue) + 1,
          )
        else
          state[i],
    ];
  }

  Dice roll(int maxValue) {
    var rng = Random();
    final dice = Dice(
      maxValue: maxValue,
      value: rng.nextInt(maxValue) + 1,
    );
    state = [...state, dice];
    return dice;
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
