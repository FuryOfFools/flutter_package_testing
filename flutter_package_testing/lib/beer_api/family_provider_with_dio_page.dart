import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'family_provider_with_dio_page.g.dart';

@riverpod
Dio dio(DioRef ref) {
  final dio = Dio();
  dio.interceptors.add(
    PrettyDioLogger(
      requestHeader: false,
      requestBody: false,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ),
  );
  return dio;
}

@riverpod
Data beerConvert(BeerConvertRef ref, Response arg) => Data(
      arg.data.first['name'],
      arg.data.first['image_url'],
      arg.data.first['description'],
    );

@riverpod
Future<Data> getBeerById(GetBeerByIdRef ref, String arg) async {
  Dio dio = ref.watch(dioProvider);
  final cancelToken = CancelToken();
  ref.onDispose(() => cancelToken.cancel());

  final response = await dio.get(
    'https://api.punkapi.com/v2/beers/$arg',
    cancelToken: cancelToken,
  );
  ref.keepAlive();
  final data = ref.watch(beerConvertProvider(response));
  return data;
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Тестирование функционала .family для работы с апи через пакет dio',
              textAlign: TextAlign.center,
            ),
            GestureDetector(
              onTap: () => ref.read(beerIdProvider.notifier).state++,
              child: Container(
                decoration: const BoxDecoration(color: Colors.blue),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Next Beer',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
            ),
            GestureDetector(
              onTap: () => ref.read(beerIdProvider.notifier).state--,
              child: Container(
                decoration: const BoxDecoration(color: Colors.blue),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Prev Beer',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const BeerDataWidget(),
          ],
        ),
      ),
    );
  }
}

final beerIdProvider = StateProvider<int>((ref) => 1);

class BeerDataWidget extends ConsumerWidget {
  const BeerDataWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(beerIdProvider);
    final bear = ref.watch(getBeerByIdProvider(id.toString()));
    return bear.when(
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => const Text('Error'),
      data: (config) {
        return Column(
          children: <Widget>[
            Text(
              'Name: ${config.name}',
              style: const TextStyle(fontSize: 18),
            ),
            Text('Description: ${config.description}'),
            Image.network(
              config.image,
              height: 300,
            ),
          ],
        );
      },
    );
  }
}
