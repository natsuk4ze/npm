// ignore_for_file: scoped_providers_should_specify_dependencies
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:npm/features/package_details/package_details_page.dart';
import 'package:npm/features/packages/packages_page.dart';
import 'package:npm/main.dart' as app;
import 'package:npm/repository.dart';
import 'package:npm/router.dart';

import 'mock.dart';

void main() {
  group('[Widget Test]', () {
    testWidgets('PackagesPage', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [repositoryProvider.overrideWithValue(MockRepository())],
          child: const app.App(),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsNothing);

      expect(
        tester.widget<PackageItem>(find.byType(PackageItem).first).package ==
            MockRepository.packages.first,
        true,
      );
    });

    testWidgets('PackageDetailsPage', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              repositoryProvider.overrideWithValue(MockRepository()),
              routerProvider.overrideWithValue(
                GoRouter(
                    routes: $appRoutes,
                    initialLocation: PackageDetailsRoute(
                            id: MockRepository.packageDetils.name)
                        .location),
              ),
            ],
            child: const app.App(),
          ),
        );

        expect(find.byType(CircularProgressIndicator), findsOneWidget);

        await tester.pump();

        expect(find.byType(CircularProgressIndicator), findsNothing);

        expect(
          tester
                  .widget<PackegeDetailsItem>(find.byType(PackegeDetailsItem))
                  .package ==
              MockRepository.packageDetils,
          true,
        );
      });
    });
  });
}
