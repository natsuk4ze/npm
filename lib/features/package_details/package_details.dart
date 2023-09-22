import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:npm/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'package_details.g.dart';
part 'package_details.freezed.dart';

@riverpod
Future<PackageDetails> packageDetails(PackageDetailsRef ref,
        {required String id}) async =>
    ref.watch(repositoryProvider).getPackageDetails(id: id);

@freezed
class PackageDetails with _$PackageDetails {
  const PackageDetails._();

  const factory PackageDetails({
    required final String name,
    @Default('') final String description,
    @Default([]) final List<String> keywords,
    required final String license,
    required final String homepage,
    required final String readme,
    @JsonKey(readValue: _repositoryReadValue) required final String repository,
  }) = _PackageDetails;
  factory PackageDetails.fromJson(Map<String, dynamic> json) =>
      _$PackageDetailsFromJson(json);
}

String _repositoryReadValue(Map json, String _) => json['repository']['url'];
