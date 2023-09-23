import 'package:npm/features/package_details/package_details.dart';
import 'package:npm/features/packages/packages.dart';
import 'package:npm/features/score/score.dart';
import 'package:npm/repository.dart';

class MockRepository implements Repository {
  @override
  Future<List<Package>> getPackges({required String search}) async =>
      List.generate(
        10,
        (i) => Package(
          name: 'package $i',
          version: '$i',
          score: Score(
            popularity: i.toDouble(),
            quality: i.toDouble(),
            maintenance: i.toDouble(),
          ),
        ),
      );
  @override
  Future<PackageDetails> getPackageDetails({required String id}) async =>
      const PackageDetails(
        name: 'package',
        license: 'MIT',
        homepage: 'https://homepage',
        readme: 'readme',
        repository: 'https://repository',
      );
}
