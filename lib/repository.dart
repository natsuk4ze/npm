import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:npm/features/package_details/package_details.dart';
import 'package:npm/features/packages/packages.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository.g.dart';

@riverpod
Repository repository(RepositoryRef ref) => Repository();

class Repository {
  final _dio = Dio();
  static const _baseUrl = 'https://registry.npmjs.org';

  Future<List<Package>> getPackges({
    required String search,
    required CancelToken cancelToken,
  }) async {
    final response = await _dio.get(
      '$_baseUrl/-/v1/search?text=$search',
      cancelToken: cancelToken,
    );
    final List packages = response.data['objects'];
    return packages
        .map((package) => Package.fromJson(package as Map<String, dynamic>))
        .toList();
  }

  Future<PackageDetails> getPackageDetails({required String id}) async {
    final response = await _dio.get('$_baseUrl/$id');
    return PackageDetails.fromJson(response.data);
  }
}

extension CancelTokenX on Ref {
  CancelToken get cancelToken {
    final cT = CancelToken();
    onDispose(cT.cancel);
    return cT;
  }
}
