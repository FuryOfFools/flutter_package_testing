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

String _$CartHash() => r'3aba8db2f67e6e7362a296b7889637d2836aae3f';

/// See also [Cart].
final cartProvider = AutoDisposeNotifierProvider<Cart, List<Beer>>(
  Cart.new,
  name: r'cartProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$CartHash,
);
typedef CartRef = AutoDisposeNotifierProviderRef<List<Beer>>;

abstract class _$Cart extends AutoDisposeNotifier<List<Beer>> {
  @override
  List<Beer> build();
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

String _$getBeersHash() => r'd563e9a9c039fec07ace61228fd602eb89bcc9fc';

/// See also [getBeers].
final getBeersProvider = AutoDisposeFutureProvider<List<Beer>>(
  getBeers,
  name: r'getBeersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getBeersHash,
);
typedef GetBeersRef = AutoDisposeFutureProviderRef<List<Beer>>;
String _$isInCartHash() => r'24121c531d94f42e69dbcf068b92a16956f20010';

/// See also [isInCart].
class IsInCartProvider extends AutoDisposeProvider<bool> {
  IsInCartProvider(
    this.beer,
  ) : super(
          (ref) => isInCart(
            ref,
            beer,
          ),
          from: isInCartProvider,
          name: r'isInCartProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$isInCartHash,
        );

  final Beer beer;

  @override
  bool operator ==(Object other) {
    return other is IsInCartProvider && other.beer == beer;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, beer.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef IsInCartRef = AutoDisposeProviderRef<bool>;

/// See also [isInCart].
final isInCartProvider = IsInCartFamily();

class IsInCartFamily extends Family<bool> {
  IsInCartFamily();

  IsInCartProvider call(
    Beer beer,
  ) {
    return IsInCartProvider(
      beer,
    );
  }

  @override
  AutoDisposeProvider<bool> getProviderOverride(
    covariant IsInCartProvider provider,
  ) {
    return call(
      provider.beer,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'isInCartProvider';
}

String _$cartCountHash() => r'75ffd08933d1a191b9ef58cae088ad1210ff115e';

/// See also [cartCount].
final cartCountProvider = AutoDisposeProvider<int>(
  cartCount,
  name: r'cartCountProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cartCountHash,
);
typedef CartCountRef = AutoDisposeProviderRef<int>;
