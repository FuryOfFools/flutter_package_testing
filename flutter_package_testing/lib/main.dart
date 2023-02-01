import 'package:flutter/material.dart';
import 'package:flutter_package_testing/counter/state_provider_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RiverpodStateProviderDemoPage(
        title: 'Riverpod StateProvider Demo',
      ),
    );
  }
}
