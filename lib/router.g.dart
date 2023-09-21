// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $packagesRoute,
    ];

RouteBase get $packagesRoute => GoRouteData.$route(
      path: '/',
      factory: $PackagesRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'details',
          factory: $PackageDetailsRouteExtension._fromState,
        ),
      ],
    );

extension $PackagesRouteExtension on PackagesRoute {
  static PackagesRoute _fromState(GoRouterState state) => const PackagesRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PackageDetailsRouteExtension on PackageDetailsRoute {
  static PackageDetailsRoute _fromState(GoRouterState state) =>
      PackageDetailsRoute(
        id: state.uri.queryParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/details',
        queryParams: {
          'id': id,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$routerHash() => r'4c8f08e1d97df668c0d3e041eab8365e7259f065';

/// See also [router].
@ProviderFor(router)
final routerProvider = AutoDisposeProvider<GoRouter>.internal(
  router,
  name: r'routerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$routerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RouterRef = AutoDisposeProviderRef<GoRouter>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
