// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'packages.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Package _$PackageFromJson(Map<String, dynamic> json) {
  return _Package.fromJson(json);
}

/// @nodoc
mixin _$Package {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get keywords => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PackageCopyWith<Package> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackageCopyWith<$Res> {
  factory $PackageCopyWith(Package value, $Res Function(Package) then) =
      _$PackageCopyWithImpl<$Res, Package>;
  @useResult
  $Res call({String name, String description, List<String> keywords});
}

/// @nodoc
class _$PackageCopyWithImpl<$Res, $Val extends Package>
    implements $PackageCopyWith<$Res> {
  _$PackageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? keywords = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      keywords: null == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PackageCopyWith<$Res> implements $PackageCopyWith<$Res> {
  factory _$$_PackageCopyWith(
          _$_Package value, $Res Function(_$_Package) then) =
      __$$_PackageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String description, List<String> keywords});
}

/// @nodoc
class __$$_PackageCopyWithImpl<$Res>
    extends _$PackageCopyWithImpl<$Res, _$_Package>
    implements _$$_PackageCopyWith<$Res> {
  __$$_PackageCopyWithImpl(_$_Package _value, $Res Function(_$_Package) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? keywords = null,
  }) {
    return _then(_$_Package(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      keywords: null == keywords
          ? _value._keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Package extends _Package {
  const _$_Package(
      {required this.name,
      this.description = '',
      final List<String> keywords = const []})
      : _keywords = keywords,
        super._();

  factory _$_Package.fromJson(Map<String, dynamic> json) =>
      _$$_PackageFromJson(json);

  @override
  final String name;
  @override
  @JsonKey()
  final String description;
  final List<String> _keywords;
  @override
  @JsonKey()
  List<String> get keywords {
    if (_keywords is EqualUnmodifiableListView) return _keywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keywords);
  }

  @override
  String toString() {
    return 'Package(name: $name, description: $description, keywords: $keywords)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Package &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._keywords, _keywords));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, description,
      const DeepCollectionEquality().hash(_keywords));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PackageCopyWith<_$_Package> get copyWith =>
      __$$_PackageCopyWithImpl<_$_Package>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PackageToJson(
      this,
    );
  }
}

abstract class _Package extends Package {
  const factory _Package(
      {required final String name,
      final String description,
      final List<String> keywords}) = _$_Package;
  const _Package._() : super._();

  factory _Package.fromJson(Map<String, dynamic> json) = _$_Package.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  List<String> get keywords;
  @override
  @JsonKey(ignore: true)
  _$$_PackageCopyWith<_$_Package> get copyWith =>
      throw _privateConstructorUsedError;
}
