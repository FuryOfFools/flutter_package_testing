// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family_provider_with_dio_page.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String _$dioHash() => r'6ba3fae61ca93215efac12cdedb7e4445df1dfc6';

/// See also [dio].
final dioProvider = AutoDisposeProvider<Dio>(
  dio,
  name: r'dioProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dioHash,
);
typedef DioRef = AutoDisposeProviderRef<Dio>;
String _$beerConvertHash() => r'b685a9f606a427dd3424f15df6e2a88cca4eb3af';

/// See also [beerConvert].
class BeerConvertProvider extends AutoDisposeProvider<Data> {
  BeerConvertProvider(
    this.arg,
  ) : super(
          (ref) => beerConvert(
            ref,
            arg,
          ),
          from: beerConvertProvider,
          name: r'beerConvertProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$beerConvertHash,
        );

  final Response<dynamic> arg;

  @override
  bool operator ==(Object other) {
    return other is BeerConvertProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef BeerConvertRef = AutoDisposeProviderRef<Data>;

/// See also [beerConvert].
final beerConvertProvider = BeerConvertFamily();

class BeerConvertFamily extends Family<Data> {
  BeerConvertFamily();

  BeerConvertProvider call(
    Response<dynamic> arg,
  ) {
    return BeerConvertProvider(
      arg,
    );
  }

  @override
  AutoDisposeProvider<Data> getProviderOverride(
    covariant BeerConvertProvider provider,
  ) {
    return call(
      provider.arg,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'beerConvertProvider';
}

String _$getDataHash() => r'231f291988a5f99cbc1abe45cac4017880ca05c0';

/// See also [getData].
class GetDataProvider extends AutoDisposeFutureProvider<Data> {
  GetDataProvider({
    required this.url,
    required this.arguments,
    this.queryParameters,
  }) : super(
          (ref) => getData(
            ref,
            url: url,
            arguments: arguments,
            queryParameters: queryParameters,
          ),
          from: getDataProvider,
          name: r'getDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getDataHash,
        );

  final String url;
  final String arguments;
  final Map<String, dynamic>? queryParameters;

  @override
  bool operator ==(Object other) {
    return other is GetDataProvider &&
        other.url == url &&
        other.arguments == arguments &&
        other.queryParameters == queryParameters;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, url.hashCode);
    hash = _SystemHash.combine(hash, arguments.hashCode);
    hash = _SystemHash.combine(hash, queryParameters.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef GetDataRef = AutoDisposeFutureProviderRef<Data>;

/// See also [getData].
final getDataProvider = GetDataFamily();

class GetDataFamily extends Family<AsyncValue<Data>> {
  GetDataFamily();

  GetDataProvider call({
    required String url,
    required String arguments,
    Map<String, dynamic>? queryParameters,
  }) {
    return GetDataProvider(
      url: url,
      arguments: arguments,
      queryParameters: queryParameters,
    );
  }

  @override
  AutoDisposeFutureProvider<Data> getProviderOverride(
    covariant GetDataProvider provider,
  ) {
    return call(
      url: provider.url,
      arguments: provider.arguments,
      queryParameters: provider.queryParameters,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'getDataProvider';
}
