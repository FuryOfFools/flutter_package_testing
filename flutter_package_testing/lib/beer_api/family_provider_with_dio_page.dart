import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package_testing/beer_api/api/api.dart';
import 'package:flutter_package_testing/beer_api/beer_class/beer.dart';
import 'package:flutter_package_testing/beer_api/cart_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'family_provider_with_dio_page.g.dart';

@riverpod
List<Beer> beersConvert(BeersConvertRef ref, Response arg) =>
    beerFromJson(jsonEncode(arg.data));

@riverpod
Future<List<Beer>> getBeers(GetBeersRef ref) async {
  var responce = await ref.watch(
    getDataProvider(
      url: 'https://api.punkapi.com/v2/beers',
      isKeepAlive: true,
    ).future,
  );
  List<Beer> beer = ref.watch(beersConvertProvider(responce));
  List<Beer> newBeer = [];
  newBeer.addAll(beer.getRange(0, 5));
  newBeer.addAll(beer.getRange(0, 5));
  newBeer.addAll(beer.getRange(0, 5));
  return newBeer;
}

@riverpod
class Cart extends _$Cart {
  @override
  List<Beer> build() {
    return [];
  }

  bool _isNotContain(Beer beer) => !state.contains(beer);

  void addToCart(Beer beer) {
    if (_isNotContain(beer)) {
      state = [
        ...state,
        beer,
      ];
    }
  }

  void removeFromCart(Beer beer) {
    state = [
      for (final item in state)
        if (item != beer) item,
    ];
  }
}

@riverpod
bool isInCart(IsInCartRef ref, Beer beer) =>
    ref.watch(cartProvider).contains(beer);

@riverpod
int cartCount(CartCountRef ref) => ref.watch(cartProvider).length;

class Data {
  final String name;
  final String image;
  final String description;

  const Data(this.name, this.image, this.description);
}

class ApiPage extends ConsumerWidget {
  const ApiPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const CartPage(),
          ),
        ),
        child: Text(ref.watch(cartCountProvider).toString()),
      ),
      appBar: AppBar(title: const Text('Api Demo with Cart')),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(8),
          child: const BeerDataWidget(),
        ),
      ),
    );
  }
}

class BeerDataWidget extends ConsumerWidget {
  const BeerDataWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bears = ref.watch(getBeersProvider);
    return bears.when(
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => const Text('Error'),
      data: (config) {
        return Column(
          children: [
            for (final beer in config) BeerWidget(beer: beer),
          ],
        );
      },
    );
  }
}

class BeerWidget extends ConsumerWidget {
  final Beer beer;
  const BeerWidget({super.key, required this.beer});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => ref.read(cartProvider.notifier).addToCart(beer),
      onDoubleTap: () => ref.read(cartProvider.notifier).removeFromCart(beer),
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: ref.watch(isInCartProvider(beer))
              ? Colors.blue[300]
              : Colors.red[300],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: ref.watch(isInCartProvider(beer)) ? Colors.blue : Colors.red,
          ),
          boxShadow: [
            BoxShadow(
              color: ref.watch(isInCartProvider(beer))
                  ? Colors.blue.withOpacity(0.5)
                  : Colors.red.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 10),
              child: Image.network(
                beer.imageUrl,
                height: 200,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    beer.name,
                    style: const TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 15)),
                  Text(
                    beer.description,
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
