import 'package:flutter/material.dart';
import 'package:flutter_package_testing/dice_roller/models/dice/dice.dart';
import 'package:flutter_package_testing/dice_roller/provider/dice_board/dice_board.dart';
import 'package:flutter_package_testing/dice_roller/provider/dice_display/dice_display.dart';
import 'package:flutter_package_testing/dice_roller/widgets/dice.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DiceDisplayWidget extends ConsumerWidget {
  const DiceDisplayWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Dice> diceDisplay = ref.watch(diceDisplayProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        diceDisplay.length,
        (index) => GestureDetector(
          onTap: () => ref
              .read(diceBoardProvider.notifier)
              .roll(diceDisplay[index].maxValue),
          child: DiceWidget(dice: diceDisplay[index]),
        ),
      ),
    );
  }
}
