import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:npm/util/dio.dart';
import 'package:npm/util/extensions.dart';
import 'package:npm/util/format.dart';
import 'package:npm/util/json.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'package_details.g.dart';
part 'package_details.freezed.dart';

@riverpod
Future<PackageDetails> packageDetails(PackageDetailsRef ref,
    {required String id}) async {
  final response = await ref.watch(dioProvider).getUri<Json>(
        Uri.parse('https://registry.npmjs.org/$id'),
      );
  return PackageDetails.fromJson(response.data!);
}

@freezed
class PackageDetails with _$PackageDetails {
  const PackageDetails._();

  const factory PackageDetails({
    required final String name,
    final String? description,
    final String? homepage,
    final String? repository,
    final String? readme,
    final List<String>? keywords,
    final String? license,
  }) = _PackageDetails;

  factory PackageDetails.fromJson(Json json) {
    final git = json['repository']?['url'] as String?;

    return PackageDetails(
      name: json['name'],
      description: json['description'],
      keywords: ListX.fromOrNull<String>(json['keywords']),
      license: json['license'],
      homepage: json['homepage'],
      repository: git == null ? null : Format.urlFromGit(git),
      readme: json['readme'],
    );
  }
}
