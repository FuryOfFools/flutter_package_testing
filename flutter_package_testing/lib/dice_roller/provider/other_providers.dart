import 'dart:async';
import 'dart:math';

import 'package:flutter_package_testing/dice_roller/models/dice/dice.dart';
import 'package:flutter_package_testing/dice_roller/provider/dice_board/dice_board.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'other_providers.g.dart';

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

@riverpod
int diceAssetValue(DiceAssetValueRef ref, int maxValue) {
  int value = 0;
  if (maxValue < 6) {
    value = 4;
  } else if (maxValue < 8) {
    value = 6;
  } else if (maxValue < 10) {
    value = 8;
  } else if (maxValue < 12) {
    value = 10;
  } else if (maxValue < 20) {
    value = 12;
  } else if (maxValue > 20) {
    value = 20;
  }

  return value;
}

@riverpod
String diceAsset(DiceAssetRef ref, int maxValue) {
  final value = ref.watch(diceAssetValueProvider(maxValue));
  return 'assets/d$value.png';
}
