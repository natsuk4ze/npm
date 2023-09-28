import 'package:npm/features/package_details/package_details.dart';
import 'package:npm/features/packages/packages.dart';
import 'package:npm/features/score/score.dart';
import 'package:npm/repository.dart';

class MockRepository implements Repository {
  static const name = 'package';
  static final packages = List.generate(
    10,
    (i) => Package(
      name: '$name $i',
      version: '$i',
      description: '',
      keywords: [],
      score: Score(
        popularity: i.toDouble(),
        quality: i.toDouble(),
        maintenance: i.toDouble(),
      ),
    ),
  );
  static const packageDetils = PackageDetails(
    name: name,
    license: 'MIT',
    homepage: 'https://homepage',
    readme: 'readme',
    repository: 'git+https://repository',
  );

  @override
  Future<List<Package>> getPackges({required String search}) async => packages;
  @override
  Future<PackageDetails> getPackageDetails({required String id}) async =>
      packageDetils;
}
