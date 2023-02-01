import 'package:flutter/material.dart';
import 'package:flutter_package_testing/dice_roller/provider/dice_model.dart';

class DiceWidget extends StatelessWidget {
  final DiceType type;
  final int value;
  const DiceWidget({super.key, required this.type, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/${type.name}.png',
          ),
          fit: BoxFit.scaleDown,
        ),
      ),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Text(
          value.toString(),
          style: const TextStyle(fontSize: 18),
        ),
      )),
    );
  }
}
