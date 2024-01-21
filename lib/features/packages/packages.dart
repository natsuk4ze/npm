import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:npm/features/score/score.dart';
import 'package:npm/repository.dart';
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
  final packages = await ref.watch(repositoryProvider).getPackges(
        search: search,
        cancelToken: cancelToken,
      );
  return packages;
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

extension ListX on List {
  static List<T>? fromOrNull<T>(Iterable<dynamic>? source) {
    if (source == null) return null;
    return List<T>.from(source);
  }
}
