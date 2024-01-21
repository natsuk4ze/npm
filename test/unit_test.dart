import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:npm/features/package_details/package_details.dart';
import 'package:npm/features/packages/packages.dart';
import 'package:npm/repository.dart';
import 'package:test/test.dart';

import 'fake_repository.dart';

void main() {
  group('[Unit Test]', () {
    test('getPackages()', () async {
      final container = ProviderContainer(
        overrides: [repositoryProvider.overrideWithValue(FakeRepository())],
      );
      const search = FakeRepository.packageName;
      expect(
        container.read(packagesProvider(search: search)),
        const AsyncValue<List<Package>>.loading(),
      );
      final packages =
          await container.read(packagesProvider(search: search).future);
      expect(
        packages,
        FakeRepository.packages,
      );
    });

    test('getPackageDetails()', () async {
      final container = ProviderContainer(
        overrides: [repositoryProvider.overrideWithValue(FakeRepository())],
      );
      const id = FakeRepository.packageName;
      expect(
        container.read(packageDetailsProvider(id: id)),
        const AsyncValue<PackageDetails>.loading(),
      );
      final packageDetails =
          await container.read(packageDetailsProvider(id: id).future);
      expect(
        packageDetails,
        FakeRepository.packageDetils,
      );
    });
  });
}
