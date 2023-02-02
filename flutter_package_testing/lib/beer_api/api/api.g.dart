// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

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
String _$getDataHash() => r'707f19a4204b3018592ca69a2af2203bcafce54c';

/// See also [getData].
class GetDataProvider extends AutoDisposeFutureProvider<Response<dynamic>> {
  GetDataProvider({
    required this.url,
    this.arguments,
    this.queryParameters,
    this.isKeepAlive = true,
  }) : super(
          (ref) => getData(
            ref,
            url: url,
            arguments: arguments,
            queryParameters: queryParameters,
            isKeepAlive: isKeepAlive,
          ),
          from: getDataProvider,
          name: r'getDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getDataHash,
        );

  final String url;
  final String? arguments;
  final Map<String, dynamic>? queryParameters;
  final bool isKeepAlive;

  @override
  bool operator ==(Object other) {
    return other is GetDataProvider &&
        other.url == url &&
        other.arguments == arguments &&
        other.queryParameters == queryParameters &&
        other.isKeepAlive == isKeepAlive;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, url.hashCode);
    hash = _SystemHash.combine(hash, arguments.hashCode);
    hash = _SystemHash.combine(hash, queryParameters.hashCode);
    hash = _SystemHash.combine(hash, isKeepAlive.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef GetDataRef = AutoDisposeFutureProviderRef<Response<dynamic>>;

/// See also [getData].
final getDataProvider = GetDataFamily();

class GetDataFamily extends Family<AsyncValue<Response<dynamic>>> {
  GetDataFamily();

  GetDataProvider call({
    required String url,
    String? arguments,
    Map<String, dynamic>? queryParameters,
    bool isKeepAlive = true,
  }) {
    return GetDataProvider(
      url: url,
      arguments: arguments,
      queryParameters: queryParameters,
      isKeepAlive: isKeepAlive,
    );
  }

  @override
  AutoDisposeFutureProvider<Response<dynamic>> getProviderOverride(
    covariant GetDataProvider provider,
  ) {
    return call(
      url: provider.url,
      arguments: provider.arguments,
      queryParameters: provider.queryParameters,
      isKeepAlive: provider.isKeepAlive,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'getDataProvider';
}
