// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'packages_page.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sortedPackagesHash() => r'e381bcca716aacda3396a18281f974d4f6cbf18b';

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

/// See also [sortedPackages].
@ProviderFor(sortedPackages)
const sortedPackagesProvider = SortedPackagesFamily();

/// See also [sortedPackages].
class SortedPackagesFamily extends Family<AsyncValue<List<Package>>> {
  /// See also [sortedPackages].
  const SortedPackagesFamily();

  /// See also [sortedPackages].
  SortedPackagesProvider call({
    required String search,
  }) {
    return SortedPackagesProvider(
      search: search,
    );
  }

  @override
  SortedPackagesProvider getProviderOverride(
    covariant SortedPackagesProvider provider,
  ) {
    return call(
      search: provider.search,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'sortedPackagesProvider';
}

/// See also [sortedPackages].
class SortedPackagesProvider extends AutoDisposeFutureProvider<List<Package>> {
  /// See also [sortedPackages].
  SortedPackagesProvider({
    required String search,
  }) : this._internal(
          (ref) => sortedPackages(
            ref as SortedPackagesRef,
            search: search,
          ),
          from: sortedPackagesProvider,
          name: r'sortedPackagesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sortedPackagesHash,
          dependencies: SortedPackagesFamily._dependencies,
          allTransitiveDependencies:
              SortedPackagesFamily._allTransitiveDependencies,
          search: search,
        );

  SortedPackagesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.search,
  }) : super.internal();

  final String search;

  @override
  Override overrideWith(
    FutureOr<List<Package>> Function(SortedPackagesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SortedPackagesProvider._internal(
        (ref) => create(ref as SortedPackagesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        search: search,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Package>> createElement() {
    return _SortedPackagesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SortedPackagesProvider && other.search == search;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, search.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SortedPackagesRef on AutoDisposeFutureProviderRef<List<Package>> {
  /// The parameter `search` of this provider.
  String get search;
}

class _SortedPackagesProviderElement
    extends AutoDisposeFutureProviderElement<List<Package>>
    with SortedPackagesRef {
  _SortedPackagesProviderElement(super.provider);

  @override
  String get search => (origin as SortedPackagesProvider).search;
}

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
