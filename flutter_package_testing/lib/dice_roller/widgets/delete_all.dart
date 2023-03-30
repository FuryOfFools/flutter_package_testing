import 'package:flutter/material.dart';
import 'package:flutter_package_testing/dice_roller/provider/dice_board/dice_board.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeleteAllDices extends ConsumerWidget {
  const DeleteAllDices({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => ref.read(diceBoardProvider.notifier).deleteAll(),
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: const BoxDecoration(color: Colors.blue),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Delete all',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
