// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dice_model.dart';

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

String _$DiceBoardHash() => r'80f22325acd195290f46f47255eb8538ca65bb8c';

/// See also [DiceBoard].
final diceBoardProvider = AutoDisposeNotifierProvider<DiceBoard, List<Dice>>(
  DiceBoard.new,
  name: r'diceBoardProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$DiceBoardHash,
);
typedef DiceBoardRef = AutoDisposeNotifierProviderRef<List<Dice>>;

abstract class _$DiceBoard extends AutoDisposeNotifier<List<Dice>> {
  @override
  List<Dice> build();
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
