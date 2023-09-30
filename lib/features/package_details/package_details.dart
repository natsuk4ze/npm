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
    final String? readme,
    final String? description,
    final List<String>? keywords,
    final String? license,
    final String? homepage,
    @JsonKey(readValue: _toRepository) required final String? repository,
  }) = _PackageDetails;
  factory PackageDetails.fromJson(Map<String, dynamic> json) =>
      _$PackageDetailsFromJson(json);
}

String? _toRepository(Map json, String _) {
  final git = json['repository']?['url'] as String?;
  if (git == null) return null;
  final int index = git.indexOf('github.com');
  if (index == -1) return null;
  final url = git.substring(index);
  return 'https://$url';
}
