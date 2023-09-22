// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'packages.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$packagesHash() => r'83ad8942d5b66209394afe12b68a2d52f43029ff';

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
  }) {
    return PackagesProvider(
      search: search,
    );
  }

  @override
  PackagesProvider getProviderOverride(
    covariant PackagesProvider provider,
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
  String? get name => r'packagesProvider';
}

/// See also [packages].
class PackagesProvider extends AutoDisposeFutureProvider<List<Package>> {
  /// See also [packages].
  PackagesProvider({
    required String search,
  }) : this._internal(
          (ref) => packages(
            ref as PackagesRef,
            search: search,
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
        );

  PackagesProvider._internal(
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
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Package>> createElement() {
    return _PackagesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PackagesProvider && other.search == search;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, search.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PackagesRef on AutoDisposeFutureProviderRef<List<Package>> {
  /// The parameter `search` of this provider.
  String get search;
}

class _PackagesProviderElement
    extends AutoDisposeFutureProviderElement<List<Package>> with PackagesRef {
  _PackagesProviderElement(super.provider);

  @override
  String get search => (origin as PackagesProvider).search;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
