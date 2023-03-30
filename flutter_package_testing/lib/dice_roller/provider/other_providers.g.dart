// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_providers.dart';

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

String _$getDiceSumHash() => r'b1dd57cfa9568abab86a0f2b3c063a998144f4dc';

/// See also [getDiceSum].
final getDiceSumProvider = AutoDisposeProvider<int>(
  getDiceSum,
  name: r'getDiceSumProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getDiceSumHash,
);
typedef GetDiceSumRef = AutoDisposeProviderRef<int>;
String _$diceAssetValueHash() => r'622e6024d36dcf92167dc7e20d5f9a743c40af93';

/// See also [diceAssetValue].
class DiceAssetValueProvider extends AutoDisposeProvider<int> {
  DiceAssetValueProvider(
    this.maxValue,
  ) : super(
          (ref) => diceAssetValue(
            ref,
            maxValue,
          ),
          from: diceAssetValueProvider,
          name: r'diceAssetValueProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$diceAssetValueHash,
        );

  final int maxValue;

  @override
  bool operator ==(Object other) {
    return other is DiceAssetValueProvider && other.maxValue == maxValue;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, maxValue.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef DiceAssetValueRef = AutoDisposeProviderRef<int>;

/// See also [diceAssetValue].
final diceAssetValueProvider = DiceAssetValueFamily();

class DiceAssetValueFamily extends Family<int> {
  DiceAssetValueFamily();

  DiceAssetValueProvider call(
    int maxValue,
  ) {
    return DiceAssetValueProvider(
      maxValue,
    );
  }

  @override
  AutoDisposeProvider<int> getProviderOverride(
    covariant DiceAssetValueProvider provider,
  ) {
    return call(
      provider.maxValue,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'diceAssetValueProvider';
}

String _$diceAssetHash() => r'61700aa7d16a09d73aac7ded6733a2027400d7b5';

/// See also [diceAsset].
class DiceAssetProvider extends AutoDisposeProvider<String> {
  DiceAssetProvider(
    this.maxValue,
  ) : super(
          (ref) => diceAsset(
            ref,
            maxValue,
          ),
          from: diceAssetProvider,
          name: r'diceAssetProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$diceAssetHash,
        );

  final int maxValue;

  @override
  bool operator ==(Object other) {
    return other is DiceAssetProvider && other.maxValue == maxValue;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, maxValue.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef DiceAssetRef = AutoDisposeProviderRef<String>;

/// See also [diceAsset].
final diceAssetProvider = DiceAssetFamily();

class DiceAssetFamily extends Family<String> {
  DiceAssetFamily();

  DiceAssetProvider call(
    int maxValue,
  ) {
    return DiceAssetProvider(
      maxValue,
    );
  }

  @override
  AutoDisposeProvider<String> getProviderOverride(
    covariant DiceAssetProvider provider,
  ) {
    return call(
      provider.maxValue,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'diceAssetProvider';
}
