import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:npm/features/package_details/package_details_page.dart';
import 'package:npm/features/packages/packages_page.dart';
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
    path: 'details',
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
