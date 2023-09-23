import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:npm/features/package_details/package_details.dart';
import 'package:npm/features/packages/packages.dart';
import 'package:npm/repository.dart';
import 'package:test/test.dart';

import 'mock.dart';

void main() {
  group('[Unit Test]', () {
    test('getPackages()', () async {
      final container = ProviderContainer(
        overrides: [repositoryProvider.overrideWithValue(MockRepository())],
      );
      const search = MockRepository.name;
      expect(
        container.read(packagesProvider(search: search)),
        const AsyncValue<List<Package>>.loading(),
      );
      await container.read(packagesProvider(search: search).future);
      expect(
        container.read(packagesProvider(search: search)).value,
        MockRepository.packages,
      );
    });

    test('getPackageDetails()', () async {
      final container = ProviderContainer(
        overrides: [repositoryProvider.overrideWithValue(MockRepository())],
      );
      const id = MockRepository.name;
      expect(
        container.read(packageDetailsProvider(id: id)),
        const AsyncValue<PackageDetails>.loading(),
      );
      await container.read(packageDetailsProvider(id: id).future);
      expect(
        container.read(packageDetailsProvider(id: id)).value,
        MockRepository.packageDetils,
      );
    });
  });
}
