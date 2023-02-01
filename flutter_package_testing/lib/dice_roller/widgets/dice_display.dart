import 'package:flutter/material.dart';
import 'package:flutter_package_testing/dice_roller/notifier_provider_page.dart';
import 'package:flutter_package_testing/dice_roller/provider/dice_model.dart';
import 'package:flutter_package_testing/dice_roller/widgets/dice.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DiceDisplay extends ConsumerWidget {
  const DiceDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: () => ref.read(diceBoardProvider.notifier).roll(DiceType.d4),
          child: const DiceWidget(
            type: DiceType.d4,
            value: 4,
          ),
        ),
        GestureDetector(
          onTap: () => ref.read(diceBoardProvider.notifier).roll(DiceType.d6),
          child: const DiceWidget(
            type: DiceType.d6,
            value: 6,
          ),
        ),
        GestureDetector(
          onTap: () => ref.read(diceBoardProvider.notifier).roll(DiceType.d8),
          child: const DiceWidget(
            type: DiceType.d8,
            value: 8,
          ),
        ),
        GestureDetector(
          onTap: () => ref.read(diceBoardProvider.notifier).roll(DiceType.d10),
          child: const DiceWidget(
            type: DiceType.d10,
            value: 10,
          ),
        ),
        GestureDetector(
          onTap: () => ref.read(diceBoardProvider.notifier).roll(DiceType.d12),
          child: const DiceWidget(
            type: DiceType.d12,
            value: 12,
          ),
        ),
        GestureDetector(
          onTap: () => ref.read(diceBoardProvider.notifier).roll(DiceType.d20),
          child: const DiceWidget(
            type: DiceType.d20,
            value: 20,
          ),
        ),
      ],
    );
    ;
  }
}
