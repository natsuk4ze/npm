import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:npm/features/package_details/package_details_item.dart';
import 'package:npm/features/packages/package_item.dart';
import 'package:npm/main.dart' as app;
import 'package:npm/repository.dart';
import 'package:npm/router.dart';

import 'fake_repository.dart';

void main() {
  group('[Widget Test]', () {
    testWidgets('PackagesPage', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [repositoryProvider.overrideWithValue(FakeRepository())],
          child: const app.App(),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 5));

      expect(find.byType(CircularProgressIndicator), findsNothing);

      expect(
        tester.widget<PackageItem>(find.byType(PackageItem).first).package ==
            FakeRepository.packages.first,
        true,
      );
    });

    testWidgets('PackageDetailsPage', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              repositoryProvider.overrideWithValue(FakeRepository()),
              routerProvider.overrideWithValue(
                GoRouter(
                    routes: $appRoutes,
                    initialLocation: PackageDetailsRoute(
                            id: FakeRepository.packageDetils.name)
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
              FakeRepository.packageDetils,
          true,
        );
      });
    });
  });
}
