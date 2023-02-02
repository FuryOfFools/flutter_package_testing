import 'package:flutter/material.dart';
import 'package:flutter_package_testing/beer_api/beer_class/beer.dart';
import 'package:flutter_package_testing/beer_api/family_provider_with_dio_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart Page')),
      body: const SingleChildScrollView(child: CartDataWidget()),
    );
  }
}

class CartDataWidget extends ConsumerWidget {
  const CartDataWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Beer> cart = ref.watch(cartProvider);
    return Container(
      decoration: BoxDecoration(color: Colors.orange[500]),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Text(
            'Cart',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            'Count: ${ref.watch(cartCountProvider)}',
            style: const TextStyle(fontSize: 20),
          ),
          for (final beer in cart) BeerWidget(beer: beer),
        ],
      ),
    );
  }
}
