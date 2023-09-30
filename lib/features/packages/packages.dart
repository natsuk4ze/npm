import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:npm/features/score/score.dart';
import 'package:npm/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'packages.g.dart';
part 'packages.freezed.dart';

@riverpod
Future<List<Package>> packages(PackagesRef ref,
        {required String search}) async =>
    ref.watch(repositoryProvider).getPackges(
          search: search,
          cancelToken: ref.cancelToken,
        );

@freezed
class Package with _$Package {
  const Package._();
  const factory Package({
    required final String name,
    required final String version,
    required final Score score,
    final String? description,
    final List<String>? keywords,
  }) = _Package;
  factory Package.fromJson(Map<String, dynamic> json) {
    final package = json['package'];
    final score = json['score']['detail'];

    return Package(
      name: package['name'],
      description: package['description'],
      version: package['version'],
      keywords: package['keywords'] != null
          ? List<String>.from(package['keywords'])
          : null,
      score: Score.fromJson(score),
    );
  }
}
