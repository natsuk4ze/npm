// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'packages.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$packagesHash() => r'109c2c6db43846adb1550c3aecd8269bbd64f9ee';

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

/// See also [packages].
@ProviderFor(packages)
const packagesProvider = PackagesFamily();

/// See also [packages].
class PackagesFamily extends Family<AsyncValue<List<Package>>> {
  /// See also [packages].
  const PackagesFamily();

  /// See also [packages].
  PackagesProvider call({
    required String search,
    bool debounce = true,
  }) {
    return PackagesProvider(
      search: search,
      debounce: debounce,
    );
  }

  @override
  PackagesProvider getProviderOverride(
    covariant PackagesProvider provider,
  ) {
    return call(
      search: provider.search,
      debounce: provider.debounce,
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
  String? get name => r'packagesProvider';
}

/// See also [packages].
class PackagesProvider extends AutoDisposeFutureProvider<List<Package>> {
  /// See also [packages].
  PackagesProvider({
    required String search,
    bool debounce = true,
  }) : this._internal(
          (ref) => packages(
            ref as PackagesRef,
            search: search,
            debounce: debounce,
          ),
          from: packagesProvider,
          name: r'packagesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$packagesHash,
          dependencies: PackagesFamily._dependencies,
          allTransitiveDependencies: PackagesFamily._allTransitiveDependencies,
          search: search,
          debounce: debounce,
        );

  PackagesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.search,
    required this.debounce,
  }) : super.internal();

  final String search;
  final bool debounce;

  @override
  Override overrideWith(
    FutureOr<List<Package>> Function(PackagesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PackagesProvider._internal(
        (ref) => create(ref as PackagesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        search: search,
        debounce: debounce,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Package>> createElement() {
    return _PackagesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PackagesProvider &&
        other.search == search &&
        other.debounce == debounce;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, search.hashCode);
    hash = _SystemHash.combine(hash, debounce.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PackagesRef on AutoDisposeFutureProviderRef<List<Package>> {
  /// The parameter `search` of this provider.
  String get search;

  /// The parameter `debounce` of this provider.
  bool get debounce;
}

class _PackagesProviderElement
    extends AutoDisposeFutureProviderElement<List<Package>> with PackagesRef {
  _PackagesProviderElement(super.provider);

  @override
  String get search => (origin as PackagesProvider).search;
  @override
  bool get debounce => (origin as PackagesProvider).debounce;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
