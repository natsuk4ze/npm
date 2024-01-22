import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:npm/util/dio.dart';
import 'package:npm/util/extensions.dart';
import 'package:npm/features/score/score.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'packages.g.dart';
part 'packages.freezed.dart';

@riverpod
Future<List<Package>> packages(
  PackagesRef ref, {
  required String search,
  bool debounce = true,
}) async {
  CancelToken? cancelToken;
  if (debounce) {
    cancelToken = ref.cancelToken;
    await Future.delayed(const Duration(milliseconds: 500));
    if (cancelToken.isCancelled) throw Exception('Cancelled');
  }
  final response = await ref.watch(dioProvider).get(
        'https://registry.npmjs.org/-/v1/search?text=$search',
        cancelToken: cancelToken,
      );
  final List packages = response.data['objects'];
  return packages
      .map((package) => Package.fromJson(package as Map<String, dynamic>))
      .toList();
}

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
      keywords: ListX.fromOrNull<String>(package['keywords']),
      score: Score.fromJson(score),
    );
  }
}
