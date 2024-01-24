import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:npm/features/package_details/package_details.dart';
import 'package:npm/features/packages/packages.dart';
import 'package:test/test.dart';

import 'fake_package_details.dart';
import 'fake_packages.dart';
import 'util.dart';

void main() {
  group('[Unit Test]', () {
    test('getPackages()', () async {
      final container = createContainer(
        overrides: [
          packagesProvider(search: fakePackagesName)
              .overrideWith(fakePackagesProvider),
        ],
      );
      expect(
        container.read(packagesProvider(search: fakePackagesName)),
        const AsyncLoading<List<Package>>(),
      );
      final packages = await container
          .read(packagesProvider(search: fakePackagesName).future);
      expect(
        packages,
        fakePackages,
      );
    });

    test('getPackageDetails()', () async {
      final container = createContainer(
        overrides: [
          packageDetailsProvider(id: fakePackageDetailsName)
              .overrideWith(fakePackageDetailsProvider),
        ],
      );
      expect(
        container.read(packageDetailsProvider(id: fakePackageDetailsName)),
        const AsyncLoading<PackageDetails>(),
      );
      final packageDetails = await container
          .read(packageDetailsProvider(id: fakePackageDetailsName).future);
      expect(
        packageDetails,
        fakePackageDetails,
      );
    });
  });
}
