// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'package_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PackageDetails {
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get homepage => throw _privateConstructorUsedError;
  String? get repository => throw _privateConstructorUsedError;
  String? get readme => throw _privateConstructorUsedError;
  List<String>? get keywords => throw _privateConstructorUsedError;
  String? get license => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PackageDetailsCopyWith<PackageDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackageDetailsCopyWith<$Res> {
  factory $PackageDetailsCopyWith(
          PackageDetails value, $Res Function(PackageDetails) then) =
      _$PackageDetailsCopyWithImpl<$Res, PackageDetails>;
  @useResult
  $Res call(
      {String name,
      String? description,
      String? homepage,
      String? repository,
      String? readme,
      List<String>? keywords,
      String? license});
}

/// @nodoc
class _$PackageDetailsCopyWithImpl<$Res, $Val extends PackageDetails>
    implements $PackageDetailsCopyWith<$Res> {
  _$PackageDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? homepage = freezed,
    Object? repository = freezed,
    Object? readme = freezed,
    Object? keywords = freezed,
    Object? license = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      homepage: freezed == homepage
          ? _value.homepage
          : homepage // ignore: cast_nullable_to_non_nullable
              as String?,
      repository: freezed == repository
          ? _value.repository
          : repository // ignore: cast_nullable_to_non_nullable
              as String?,
      readme: freezed == readme
          ? _value.readme
          : readme // ignore: cast_nullable_to_non_nullable
              as String?,
      keywords: freezed == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      license: freezed == license
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PackageDetailsImplCopyWith<$Res>
    implements $PackageDetailsCopyWith<$Res> {
  factory _$$PackageDetailsImplCopyWith(_$PackageDetailsImpl value,
          $Res Function(_$PackageDetailsImpl) then) =
      __$$PackageDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String? description,
      String? homepage,
      String? repository,
      String? readme,
      List<String>? keywords,
      String? license});
}

/// @nodoc
class __$$PackageDetailsImplCopyWithImpl<$Res>
    extends _$PackageDetailsCopyWithImpl<$Res, _$PackageDetailsImpl>
    implements _$$PackageDetailsImplCopyWith<$Res> {
  __$$PackageDetailsImplCopyWithImpl(
      _$PackageDetailsImpl _value, $Res Function(_$PackageDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? homepage = freezed,
    Object? repository = freezed,
    Object? readme = freezed,
    Object? keywords = freezed,
    Object? license = freezed,
  }) {
    return _then(_$PackageDetailsImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      homepage: freezed == homepage
          ? _value.homepage
          : homepage // ignore: cast_nullable_to_non_nullable
              as String?,
      repository: freezed == repository
          ? _value.repository
          : repository // ignore: cast_nullable_to_non_nullable
              as String?,
      readme: freezed == readme
          ? _value.readme
          : readme // ignore: cast_nullable_to_non_nullable
              as String?,
      keywords: freezed == keywords
          ? _value._keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      license: freezed == license
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PackageDetailsImpl extends _PackageDetails {
  const _$PackageDetailsImpl(
      {required this.name,
      this.description,
      this.homepage,
      this.repository,
      this.readme,
      final List<String>? keywords,
      this.license})
      : _keywords = keywords,
        super._();

  @override
  final String name;
  @override
  final String? description;
  @override
  final String? homepage;
  @override
  final String? repository;
  @override
  final String? readme;
  final List<String>? _keywords;
  @override
  List<String>? get keywords {
    final value = _keywords;
    if (value == null) return null;
    if (_keywords is EqualUnmodifiableListView) return _keywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? license;

  @override
  String toString() {
    return 'PackageDetails(name: $name, description: $description, homepage: $homepage, repository: $repository, readme: $readme, keywords: $keywords, license: $license)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PackageDetailsImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.homepage, homepage) ||
                other.homepage == homepage) &&
            (identical(other.repository, repository) ||
                other.repository == repository) &&
            (identical(other.readme, readme) || other.readme == readme) &&
            const DeepCollectionEquality().equals(other._keywords, _keywords) &&
            (identical(other.license, license) || other.license == license));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      description,
      homepage,
      repository,
      readme,
      const DeepCollectionEquality().hash(_keywords),
      license);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PackageDetailsImplCopyWith<_$PackageDetailsImpl> get copyWith =>
      __$$PackageDetailsImplCopyWithImpl<_$PackageDetailsImpl>(
          this, _$identity);
}

abstract class _PackageDetails extends PackageDetails {
  const factory _PackageDetails(
      {required final String name,
      final String? description,
      final String? homepage,
      final String? repository,
      final String? readme,
      final List<String>? keywords,
      final String? license}) = _$PackageDetailsImpl;
  const _PackageDetails._() : super._();

  @override
  String get name;
  @override
  String? get description;
  @override
  String? get homepage;
  @override
  String? get repository;
  @override
  String? get readme;
  @override
  List<String>? get keywords;
  @override
  String? get license;
  @override
  @JsonKey(ignore: true)
  _$$PackageDetailsImplCopyWith<_$PackageDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
