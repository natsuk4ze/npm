import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:npm/features/package_details/package_details.dart';
import 'package:npm/features/packages/packages.dart';
import 'package:npm/features/packages/packages_page.dart';
import 'package:npm/main.dart' as app;
import 'package:npm/router.dart';
import 'package:npm/util/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fake_package_details.dart';
import 'fake_packages.dart';

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));
  group('[Widget Test]', () {
    testWidgets('PackagesPage', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            packagesProvider(search: initialSearchText)
                .overrideWith(fakePackagesProvider),
            sharedPreferencesProvider
                .overrideWithValue(await SharedPreferences.getInstance()),
          ],
          child: const app.App(),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pumpAndSettle();

      expect(find.byType(CircularProgressIndicator), findsNothing);

      expect(find.textContaining(fakePackagesName), findsAny);
    });

    testWidgets('PackageDetailsPage', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            packageDetailsProvider(id: fakePackageDetailsName)
                .overrideWith(fakePackageDetailsProvider),
            sharedPreferencesProvider
                .overrideWithValue(await SharedPreferences.getInstance()),
            routerProvider.overrideWithValue(
              GoRouter(
                routes: $appRoutes,
                initialLocation:
                    const PackageDetailsRoute(id: fakePackageDetailsName)
                        .location,
              ),
            ),
          ],
          child: const app.App(),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pumpAndSettle();

      expect(find.byType(CircularProgressIndicator), findsNothing);

      await tester.pumpAndSettle();

      expect(find.textContaining(fakePackageDetailsName), findsOne);
    });
  });
}
