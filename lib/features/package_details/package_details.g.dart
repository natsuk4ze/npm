// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PackageDetails _$$_PackageDetailsFromJson(Map<String, dynamic> json) =>
    _$_PackageDetails(
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      keywords: (json['keywords'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      readme: json['readme'] as String,
      license: json['license'] as String?,
      homepage: json['homepage'] as String?,
      repository: _repositoryReadValue(json, 'repository') as String?,
    );

Map<String, dynamic> _$$_PackageDetailsToJson(_$_PackageDetails instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'keywords': instance.keywords,
      'readme': instance.readme,
      'license': instance.license,
      'homepage': instance.homepage,
      'repository': instance.repository,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$packageDetailsHash() => r'5c922040fe6f945f121405739d7e068c7b06d76e';

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

/// See also [packageDetails].
@ProviderFor(packageDetails)
const packageDetailsProvider = PackageDetailsFamily();

/// See also [packageDetails].
class PackageDetailsFamily extends Family<AsyncValue<PackageDetails>> {
  /// See also [packageDetails].
  const PackageDetailsFamily();

  /// See also [packageDetails].
  PackageDetailsProvider call({
    required String id,
  }) {
    return PackageDetailsProvider(
      id: id,
    );
  }

  @override
  PackageDetailsProvider getProviderOverride(
    covariant PackageDetailsProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'packageDetailsProvider';
}

/// See also [packageDetails].
class PackageDetailsProvider extends AutoDisposeFutureProvider<PackageDetails> {
  /// See also [packageDetails].
  PackageDetailsProvider({
    required String id,
  }) : this._internal(
          (ref) => packageDetails(
            ref as PackageDetailsRef,
            id: id,
          ),
          from: packageDetailsProvider,
          name: r'packageDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$packageDetailsHash,
          dependencies: PackageDetailsFamily._dependencies,
          allTransitiveDependencies:
              PackageDetailsFamily._allTransitiveDependencies,
          id: id,
        );

  PackageDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<PackageDetails> Function(PackageDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PackageDetailsProvider._internal(
        (ref) => create(ref as PackageDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PackageDetails> createElement() {
    return _PackageDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PackageDetailsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PackageDetailsRef on AutoDisposeFutureProviderRef<PackageDetails> {
  /// The parameter `id` of this provider.
  String get id;
}

class _PackageDetailsProviderElement
    extends AutoDisposeFutureProviderElement<PackageDetails>
    with PackageDetailsRef {
  _PackageDetailsProviderElement(super.provider);

  @override
  String get id => (origin as PackageDetailsProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
