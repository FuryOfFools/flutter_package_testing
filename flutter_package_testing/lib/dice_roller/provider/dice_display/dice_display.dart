import 'package:flutter_package_testing/dice_roller/models/dice/dice.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dice_display.g.dart';

@riverpod
class DiceDisplay extends _$DiceDisplay {
  @override
  List<Dice> build() {
    List<Dice> dices = [];
    dices.add(Dice(maxValue: 4, value: 4));
    dices.add(Dice(maxValue: 6, value: 6));
    dices.add(Dice(maxValue: 8, value: 8));
    dices.add(Dice(maxValue: 10, value: 10));
    dices.add(Dice(maxValue: 12, value: 12));
    dices.add(Dice(maxValue: 20, value: 20));
    return dices;
  }

  void addDice(maxValue) {
    state = [...state, Dice(maxValue: maxValue, value: maxValue)];
  }
}
