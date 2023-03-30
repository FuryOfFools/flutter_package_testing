import 'package:flutter/material.dart';
import 'package:flutter_package_testing/dice_roller/models/dice/dice.dart';
import 'package:flutter_package_testing/dice_roller/provider/other_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DiceWidget extends ConsumerWidget {
  final Dice dice;
  const DiceWidget({
    super.key,
    required this.dice,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String asset = ref.watch(diceAssetProvider(dice.maxValue));
    return Container(
      width: 60,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(asset),
          fit: BoxFit.scaleDown,
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            dice.value.toString(),
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
