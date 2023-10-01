import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:npm/features/settings/language.dart';
import 'package:npm/features/settings/theme.dart';
import 'package:npm/router.dart';

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
            label: translate.naviBar.search,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: translate.naviBar.settings,
          ),
        ],
        onTap: (index) => switch (index) {
          1 => const SettingsRoute().go(context),
          _ => const PackagesRoute().go(context)
        },
        currentIndex: switch (path) {
          SettingsRoute.path => 1,
          _ => 0,
        },
      ),
    );
  }
}

class SideNaviBar extends ConsumerWidget {
  const SideNaviBar({
    this.floatingActionButton,
    super.key,
  });

  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final path = GoRouterState.of(context).path;
    final darkMode = ref.watch(darkModeProvider);
    final translate = ref.watch(translationProvider);

    return SizedBox(
      width: 104,
      child: NavigationRail(
        groupAlignment: 1.0,
        labelType: NavigationRailLabelType.all,
        selectedIndex: switch (path) {
          PackagesRoute.path => 0,
          SettingsRoute.path => 1,
          _ => null,
        },
        leading: Column(
          children: [
            GestureDetector(
              onTap: () => const PackagesRoute().go(context),
              child: SizedBox(
                width: 80,
                child: Image.asset(
                  'assets/app/npm.png',
                  color: darkMode ? Colors.white : null,
                ),
              ),
            ),
            const Gap(20),
            floatingActionButton ?? const SizedBox.shrink(),
          ],
        ),
        onDestinationSelected: (index) => switch (index) {
          1 => const SettingsRoute().go(context),
          _ => const PackagesRoute().go(context)
        },
        destinations: [
          path == PackagesRoute.path
              ? NavigationRailDestination(
                  icon: const Icon(Icons.list),
                  label: Text(translate.naviBar.packages),
                )
              : NavigationRailDestination(
                  icon: const Icon(Icons.search),
                  label: Text(translate.naviBar.search),
                ),
          NavigationRailDestination(
            icon: const Icon(Icons.settings),
            label: Text(translate.naviBar.settings),
          ),
        ],
      ),
    );
  }
}
