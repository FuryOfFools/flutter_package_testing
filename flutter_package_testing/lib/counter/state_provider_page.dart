import 'package:flutter/material.dart';
import 'package:flutter_package_testing/beer_api/family_provider_with_dio_page.dart';
import 'package:flutter_package_testing/dice_roller/notifier_provider_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider<int>((ref) => 0);

class RiverpodStateProviderDemoPage extends ConsumerWidget {
  final String title;
  const RiverpodStateProviderDemoPage({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer(
              builder: (context, ref, child) {
                return Text(
                  '${ref.watch(counterProvider)}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            const ButtonWidget(page: ApiPage(), title: 'Api Demo'),
            const Padding(padding: EdgeInsets.all(8.0)),
            const ButtonWidget(
              page: NotifierProviderPage(),
              title: 'Models Demo',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(counterProvider.notifier).state++,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final Widget page;
  final String title;
  const ButtonWidget({super.key, required this.page, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => page,
      )),
      child: Container(
        decoration: const BoxDecoration(color: Colors.blue),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
