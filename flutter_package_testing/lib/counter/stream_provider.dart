import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamCounter = StreamProvider<int>((ref) async* {
  while (true) {
    await Future.delayed(const Duration(seconds: 2));

    yield Random().nextInt(100);
  }
});
