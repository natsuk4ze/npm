import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:npm/features/package_details/package_details_page.dart';
import 'package:npm/features/packages/packages_page.dart';
import 'package:npm/features/settings/settings_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
Raw<GoRouter> router(RouterRef ref) {
  final router = GoRouter(routes: $appRoutes);
  ref.onDispose(router.dispose);
  return router;
}

@TypedGoRoute<PackagesRoute>(path: PackagesRoute.path, routes: [
  TypedGoRoute<PackageDetailsRoute>(
    path: '${PackageDetailsRoute.path}/:id',
  ),
  TypedGoRoute<SettingsRoute>(
    path: SettingsRoute.path,
  ),
])
@immutable
class PackagesRoute extends GoRouteData {
  const PackagesRoute();

  static const String path = '/';

  @override
  Widget build(context, state) => const PackagesPage();
}

@immutable
class PackageDetailsRoute extends GoRouteData {
  const PackageDetailsRoute({required this.id});

  final String id;

  static const String path = 'details';

  @override
  Widget build(context, state) => PackageDetailsPage(id: id);
}

@immutable
class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  static const String path = 'settings';

  @override
  NoTransitionPage<void> buildPage(context, state) => const NoTransitionPage(
        child: SettingsPage(),
      );
}
