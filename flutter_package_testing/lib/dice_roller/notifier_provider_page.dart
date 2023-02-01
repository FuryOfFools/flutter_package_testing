import 'package:flutter/material.dart';
import 'package:flutter_package_testing/dice_roller/provider/dice_model.dart';
import 'package:flutter_package_testing/dice_roller/widgets/delete_all.dart';
import 'package:flutter_package_testing/dice_roller/widgets/dice.dart';
import 'package:flutter_package_testing/dice_roller/widgets/dice_display.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotifierProviderPage extends StatelessWidget {
  const NotifierProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Models Demo'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Consumer(
                      builder: (context, ref, child) {
                        int mod = ref.watch(modProvider);
                        return Row(
                          children: [
                            const DeleteAllDices(),
                            GestureDetector(
                              onTap: () =>
                                  ref.read(modProvider.notifier).state++,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                ),
                                child: const Icon(Icons.add),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                mod.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () =>
                                  ref.read(modProvider.notifier).state--,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                ),
                                child: const Icon(Icons.remove),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                    const DiceDisplay(),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const DiceBoard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DiceBoard extends ConsumerWidget {
  const DiceBoard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Dice> dices = ref.watch(diceBoardProvider);
    return dices.isNotEmpty
        ? Column(
            children: <Widget>[
              Text(
                  'Sum + ${ref.watch(modProvider)}: ${ref.watch(getDiceSumProvider) + ref.watch(modProvider)}'),
              Wrap(
                children: <Widget>[
                  for (int i = 0; i < dices.length; i++)
                    GestureDetector(
                      onLongPress: () =>
                          ref.read(diceBoardProvider.notifier).deleteDice(i),
                      onTap: () =>
                          ref.read(diceBoardProvider.notifier).reroll(i),
                      child: DiceWidget(
                          type: dices[i].type, value: dices[i].value),
                    )
                ],
              ),
            ],
          )
        : const SizedBox();
  }
}
