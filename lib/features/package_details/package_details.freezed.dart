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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PackageDetails _$PackageDetailsFromJson(Map<String, dynamic> json) {
  return _PackageDetails.fromJson(json);
}

/// @nodoc
mixin _$PackageDetails {
  String get name => throw _privateConstructorUsedError;
  String? get readme => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<String>? get keywords => throw _privateConstructorUsedError;
  String? get license => throw _privateConstructorUsedError;
  String? get homepage => throw _privateConstructorUsedError;
  @JsonKey(readValue: _toRepository)
  String? get repository => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
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
      String? readme,
      String? description,
      List<String>? keywords,
      String? license,
      String? homepage,
      @JsonKey(readValue: _toRepository) String? repository});
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
    Object? readme = freezed,
    Object? description = freezed,
    Object? keywords = freezed,
    Object? license = freezed,
    Object? homepage = freezed,
    Object? repository = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      readme: freezed == readme
          ? _value.readme
          : readme // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      keywords: freezed == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      license: freezed == license
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as String?,
      homepage: freezed == homepage
          ? _value.homepage
          : homepage // ignore: cast_nullable_to_non_nullable
              as String?,
      repository: freezed == repository
          ? _value.repository
          : repository // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PackageDetailsCopyWith<$Res>
    implements $PackageDetailsCopyWith<$Res> {
  factory _$$_PackageDetailsCopyWith(
          _$_PackageDetails value, $Res Function(_$_PackageDetails) then) =
      __$$_PackageDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String? readme,
      String? description,
      List<String>? keywords,
      String? license,
      String? homepage,
      @JsonKey(readValue: _toRepository) String? repository});
}

/// @nodoc
class __$$_PackageDetailsCopyWithImpl<$Res>
    extends _$PackageDetailsCopyWithImpl<$Res, _$_PackageDetails>
    implements _$$_PackageDetailsCopyWith<$Res> {
  __$$_PackageDetailsCopyWithImpl(
      _$_PackageDetails _value, $Res Function(_$_PackageDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? readme = freezed,
    Object? description = freezed,
    Object? keywords = freezed,
    Object? license = freezed,
    Object? homepage = freezed,
    Object? repository = freezed,
  }) {
    return _then(_$_PackageDetails(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      readme: freezed == readme
          ? _value.readme
          : readme // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      keywords: freezed == keywords
          ? _value._keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      license: freezed == license
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as String?,
      homepage: freezed == homepage
          ? _value.homepage
          : homepage // ignore: cast_nullable_to_non_nullable
              as String?,
      repository: freezed == repository
          ? _value.repository
          : repository // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PackageDetails extends _PackageDetails {
  const _$_PackageDetails(
      {required this.name,
      this.readme,
      this.description,
      final List<String>? keywords,
      this.license,
      this.homepage,
      @JsonKey(readValue: _toRepository) required this.repository})
      : _keywords = keywords,
        super._();

  factory _$_PackageDetails.fromJson(Map<String, dynamic> json) =>
      _$$_PackageDetailsFromJson(json);

  @override
  final String name;
  @override
  final String? readme;
  @override
  final String? description;
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
  final String? homepage;
  @override
  @JsonKey(readValue: _toRepository)
  final String? repository;

  @override
  String toString() {
    return 'PackageDetails(name: $name, readme: $readme, description: $description, keywords: $keywords, license: $license, homepage: $homepage, repository: $repository)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PackageDetails &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.readme, readme) || other.readme == readme) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._keywords, _keywords) &&
            (identical(other.license, license) || other.license == license) &&
            (identical(other.homepage, homepage) ||
                other.homepage == homepage) &&
            (identical(other.repository, repository) ||
                other.repository == repository));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      readme,
      description,
      const DeepCollectionEquality().hash(_keywords),
      license,
      homepage,
      repository);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PackageDetailsCopyWith<_$_PackageDetails> get copyWith =>
      __$$_PackageDetailsCopyWithImpl<_$_PackageDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PackageDetailsToJson(
      this,
    );
  }
}

abstract class _PackageDetails extends PackageDetails {
  const factory _PackageDetails(
      {required final String name,
      final String? readme,
      final String? description,
      final List<String>? keywords,
      final String? license,
      final String? homepage,
      @JsonKey(readValue: _toRepository)
      required final String? repository}) = _$_PackageDetails;
  const _PackageDetails._() : super._();

  factory _PackageDetails.fromJson(Map<String, dynamic> json) =
      _$_PackageDetails.fromJson;

  @override
  String get name;
  @override
  String? get readme;
  @override
  String? get description;
  @override
  List<String>? get keywords;
  @override
  String? get license;
  @override
  String? get homepage;
  @override
  @JsonKey(readValue: _toRepository)
  String? get repository;
  @override
  @JsonKey(ignore: true)
  _$$_PackageDetailsCopyWith<_$_PackageDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
