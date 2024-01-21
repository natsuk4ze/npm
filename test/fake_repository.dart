import 'package:dio/dio.dart';
import 'package:npm/features/package_details/package_details.dart';
import 'package:npm/features/packages/packages.dart';
import 'package:npm/features/score/score.dart';
import 'package:npm/repository.dart';

class FakeRepository implements Repository {
  static const packageName = 'package';
  static final packages = List.generate(
    10,
    (i) => Package(
      name: '$packageName $i',
      version: '$i',
      description: 'description',
      keywords: ['keyword'],
      score: Score(
        popularity: i.toDouble(),
        quality: i.toDouble(),
        maintenance: i.toDouble(),
      ),
    ),
  );
  static const packageDetils = PackageDetails(
    name: packageName,
    license: 'MIT',
    homepage: 'https://homepage',
    readme: 'readme',
    repository: 'git+https://repository',
  );

  @override
  Future<List<Package>> getPackges({
    required String search,
    CancelToken? cancelToken,
  }) async =>
      packages;

  @override
  Future<PackageDetails> getPackageDetails({required String id}) async =>
      packageDetils;
}
