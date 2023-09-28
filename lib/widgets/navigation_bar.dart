import 'package:flutter/material.dart';
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

class SideNaviBar extends ConsumerWidget {
  const SideNaviBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final path = GoRouterState.of(context).path;
    final darkMode = ref.watch(darkModeProvider);
    final translate = ref.watch(translationProvider);

    return NavigationRail(
      labelType: NavigationRailLabelType.all,
      selectedIndex: switch (path) {
        'settings' => 1,
        _ => 0,
      },
      leading: GestureDetector(
        onTap: () => const PackagesRoute().go(context),
        child: SizedBox(
          width: 80,
          child: Image.asset(
            'assets/app/npm.png',
            color: darkMode ? Colors.white : null,
          ),
        ),
      ),
      onDestinationSelected: (index) => switch (index) {
        1 => const SettingsRoute().go(context),
        _ => const PackagesRoute().go(context)
      },
      destinations: [
        NavigationRailDestination(
          icon: const Icon(Icons.search),
          label: Text(translate.bottomNaviBar.search),
        ),
        NavigationRailDestination(
          icon: const Icon(Icons.settings),
          label: Text(translate.bottomNaviBar.settings),
        ),
      ],
    );
  }
}
