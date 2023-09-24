import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:npm/features/package_details/package_details_page.dart';
import 'package:npm/features/packages/packages_page.dart';
import 'package:npm/features/settings/settings_page.dart';
import 'package:npm/i18n/language.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
Raw<GoRouter> router(RouterRef ref) {
  final router = GoRouter(
    routes: $appRoutes,
  );
  ref.onDispose(router.dispose);
  return router;
}

@TypedGoRoute<PackagesRoute>(path: '/', routes: [
  TypedGoRoute<PackageDetailsRoute>(
    path: 'details/:id',
  ),
  TypedGoRoute<SettingsRoute>(
    path: 'settings',
  ),
])
@immutable
class PackagesRoute extends GoRouteData {
  const PackagesRoute();

  @override
  Widget build(context, state) => const PackagesPage();
}

@immutable
class PackageDetailsRoute extends GoRouteData {
  const PackageDetailsRoute({required this.id});

  final String id;

  @override
  Widget build(context, state) => PackageDetailsPage(id: id);
}

@immutable
class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  @override
  Widget build(context, state) => const SettingsPage();
}

class BottomNaviBar extends ConsumerWidget {
  const BottomNaviBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final path = GoRouterState.of(context).path;
    final translate = ref.watch(translationProvider);
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: translate.bottomNaviBar.search,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: translate.bottomNaviBar.settings,
          ),
        ],
        onTap: (index) => switch (index) {
          1 => const SettingsRoute().go(context),
          _ => const PackagesRoute().go(context)
        },
        currentIndex: switch (path) {
          'settings' => 1,
          _ => 0,
        },
      ),
    );
  }
}
