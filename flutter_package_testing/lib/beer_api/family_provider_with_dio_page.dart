import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package_testing/beer_api/api/api.dart';
import 'package:flutter_package_testing/beer_api/beer_class/beer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'family_provider_with_dio_page.g.dart';

// @riverpod
// Beer beerConvert(BeerConvertRef ref, Response arg) =>
//     beerFromJson(jsonEncode(arg.data)).first;

// @riverpod
// Future<Beer> getBeerById(
//   GetBeerByIdRef ref, {
//   required String id,
// }) async {
//   var responce = await ref.watch(
//     getDataProvider(
//       url: 'https://api.punkapi.com/v2/beers/',
//       arguments: ref.watch(beerIdProvider).toString(),
//       isKeepAlive: true,
//     ).future,
//   );
//   Beer beer = ref.watch(beerConvertProvider(responce));
//   return beer;
// }

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
  return beer;
}

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
      appBar: AppBar(title: const Text('Api Demo')),
      body: const Padding(
        padding: EdgeInsets.all(15.0),
        child: BeerDataWidget(),
        // child: Column(
        //   children: const [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: <Widget>[
        //     GestureDetector(
        //       onTap: () => ref.read(beerIdProvider.notifier).state++,
        //       child: Container(
        //         decoration: const BoxDecoration(color: Colors.blue),
        //         child: const Padding(
        //           padding: EdgeInsets.all(8.0),
        //           child: Text(
        //             'Next Beer',
        //             style: TextStyle(color: Colors.white),
        //           ),
        //         ),
        //       ),
        //     ),
        //     const Padding(
        //       padding: EdgeInsets.all(8.0),
        //     ),
        //     GestureDetector(
        //       onTap: () => ref.read(beerIdProvider.notifier).state--,
        //       child: Container(
        //         decoration: const BoxDecoration(color: Colors.blue),
        //         child: const Padding(
        //           padding: EdgeInsets.all(8.0),
        //           child: Text(
        //             'Prev Beer',
        //             style: TextStyle(color: Colors.white),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        // ],
        // ),
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
        return ListView.builder(
          itemCount: config.length,
          itemBuilder: (context, index) => BeerWidget(beer: config[index]),
        );
      },
    );
  }
}

class BeerWidget extends StatelessWidget {
  final Beer beer;
  const BeerWidget({super.key, required this.beer});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blue[300],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.5),
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
    );
  }
}

final beerIdProvider = StateProvider<int>((ref) => 1);

// class BeerDataWidget extends ConsumerWidget {
//   const BeerDataWidget({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final bear = ref.watch(
//       getBeerByIdProvider(
//         id: ref.watch(beerIdProvider).toString(),
//       ),
//     );
//     return bear.when(
//       loading: () => const CircularProgressIndicator(),
//       error: (err, stack) => const Text('Error'),
//       data: (config) {
//         return Container(
//           margin: const EdgeInsets.all(8),
//           padding: const EdgeInsets.all(8),
//           decoration: BoxDecoration(
//             color: Colors.blue[300],
//             borderRadius: BorderRadius.circular(8),
//             border: Border.all(color: Colors.blue),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.blue.withOpacity(0.5),
//                 spreadRadius: 5,
//                 blurRadius: 7,
//                 offset: const Offset(0, 3), // changes position of shadow
//               ),
//             ],
//           ),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.only(right: 20, left: 10),
//                 child: Image.network(
//                   config.imageUrl,
//                   height: 200,
//                 ),
//               ),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     Text(
//                       config.name,
//                       style: const TextStyle(fontSize: 25, color: Colors.white),
//                     ),
//                     const Padding(padding: EdgeInsets.only(bottom: 15)),
//                     Text(
//                       config.description,
//                       style: const TextStyle(color: Colors.white),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
