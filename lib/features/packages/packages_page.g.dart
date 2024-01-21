// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'packages_page.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchControllerHash() => r'373ca7c3f17a77b62a9e574314712eb14ff38fc8';

/// See also [searchController].
@ProviderFor(searchController)
final searchControllerProvider =
    AutoDisposeProvider<Raw<TextEditingController>>.internal(
  searchController,
  name: r'searchControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SearchControllerRef
    = AutoDisposeProviderRef<Raw<TextEditingController>>;
String _$sortHash() => r'0e39309c3109d3dbd35deaaf10c62dde6de29523';

/// See also [Sort].
@ProviderFor(Sort)
final sortProvider = AutoDisposeNotifierProvider<Sort, ScoreType?>.internal(
  Sort.new,
  name: r'sortProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sortHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Sort = AutoDisposeNotifier<ScoreType?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
