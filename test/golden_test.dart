// ignore_for_file: scoped_providers_should_specify_dependencies
import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:npm/features/package_details/package_details.dart';
import 'package:npm/features/package_details/package_details_page.dart';
import 'package:npm/features/packages/packages.dart';
import 'package:npm/features/packages/packages_page.dart';
import 'package:npm/util/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';

import 'fake_package_details.dart';
import 'fake_packages.dart';

void main() {
  group(['Golden Test'], () {
    testGoldens(
      'PackagesPage',
      (tester) async {
        SharedPreferences.setMockInitialValues({});
        final prefs = await SharedPreferences.getInstance();
        final builder = DeviceBuilder()
          ..addScenario(
              widget: ProviderScope(
            overrides: [
              packagesProvider(search: initialSearchText)
                  .overrideWith(fakePackagesProvider),
              sharedPreferencesProvider.overrideWith((_) => prefs),
            ],
            child: const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: PackagesPage(),
            ),
          ));
        await tester.pumpDeviceBuilder(builder);
        await screenMatchesGolden(tester, 'packages_page');
      },
    );

    testGoldens(
      'PackageDetailsPage',
      (tester) async {
        SharedPreferences.setMockInitialValues({});
        final prefs = await SharedPreferences.getInstance();
        final builder = DeviceBuilder()
          ..addScenario(
              widget: ProviderScope(
            overrides: [
              packageDetailsProvider(id: fakePackageDetailsName)
                  .overrideWith(fakePackageDetailsProvider),
              sharedPreferencesProvider.overrideWith((_) => prefs),
            ],
            child: const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: PackageDetailsPage(id: fakePackageDetailsName),
            ),
          ));
        await tester.pumpDeviceBuilder(builder);
        await screenMatchesGolden(tester, 'pakage_details_page');
      },
    );
  });
}
