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

String _$beersConvertHash() => r'f5b4ba0f8bfc6261c34f95ab9f846ce832d1fb78';

/// See also [beersConvert].
class BeersConvertProvider extends AutoDisposeProvider<List<Beer>> {
  BeersConvertProvider(
    this.arg,
  ) : super(
          (ref) => beersConvert(
            ref,
            arg,
          ),
          from: beersConvertProvider,
          name: r'beersConvertProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$beersConvertHash,
        );

  final Response<dynamic> arg;

  @override
  bool operator ==(Object other) {
    return other is BeersConvertProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef BeersConvertRef = AutoDisposeProviderRef<List<Beer>>;

/// See also [beersConvert].
final beersConvertProvider = BeersConvertFamily();

class BeersConvertFamily extends Family<List<Beer>> {
  BeersConvertFamily();

  BeersConvertProvider call(
    Response<dynamic> arg,
  ) {
    return BeersConvertProvider(
      arg,
    );
  }

  @override
  AutoDisposeProvider<List<Beer>> getProviderOverride(
    covariant BeersConvertProvider provider,
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
  String? get name => r'beersConvertProvider';
}

String _$getBeersHash() => r'0c34af53cd0fa3c57ff6e23a409a57b629e34d1d';

/// See also [getBeers].
final getBeersProvider = AutoDisposeFutureProvider<List<Beer>>(
  getBeers,
  name: r'getBeersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getBeersHash,
);
typedef GetBeersRef = AutoDisposeFutureProviderRef<List<Beer>>;
