import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:npm/features/settings/language.dart';
import 'package:npm/features/settings/theme.dart';
import 'package:npm/i18n/strings.g.dart';
import 'package:npm/router.dart';

enum _Items {
  packages,
  settings;

  Icon get icon => switch (this) {
        packages => const Icon(Icons.search),
        settings => const Icon(Icons.settings),
      };

  String label(StringsEn translate) => switch (this) {
        packages => translate.naviBar.search,
        settings => translate.naviBar.settings,
      };

  String get location => switch (this) {
        packages => const PackagesRoute().location,
        settings => const SettingsRoute().location,
      };
}

class BottomNaviBar extends ConsumerWidget {
  const BottomNaviBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = GoRouterState.of(context).fullPath;
    final translate = ref.watch(translationProvider);

    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        items: [
          for (var item in _Items.values)
            BottomNavigationBarItem(
              icon: item.icon,
              label: item.label(translate),
            )
        ],
        onTap: (index) => context.go(_Items.values[index].location),
        currentIndex: _Items.values
            .firstWhere((item) => item.location == location,
                orElse: () => _Items.packages)
            .index,
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
    final location = GoRouterState.of(context).fullPath;
    final isDarkMode = ref.watch(isDarkModeProvider);
    final translate = ref.watch(translationProvider);

    return SizedBox(
      width: 104,
      child: NavigationRail(
        groupAlignment: 1.0,
        labelType: NavigationRailLabelType.all,
        selectedIndex: _Items.values
            .firstWhereOrNull((item) => item.location == location)
            ?.index,
        leading: Column(
          children: [
            GestureDetector(
              onTap: () => const PackagesRoute().go(context),
              child: SizedBox(
                width: 80,
                child: Image.asset(
                  'assets/app/npm.png',
                  color: isDarkMode ? Colors.white : null,
                ),
              ),
            ),
            const Gap(20),
            floatingActionButton ?? const SizedBox.shrink(),
          ],
        ),
        onDestinationSelected: (index) =>
            context.go(_Items.values[index].location),
        destinations: [
          for (var item in _Items.values)
            (location == _Items.packages.location && item == _Items.packages)
                ? NavigationRailDestination(
                    icon: const Icon(Icons.list),
                    label: Text(translate.naviBar.packages),
                  )
                : NavigationRailDestination(
                    icon: item.icon,
                    label: Text(item.label(translate)),
                  )
        ],
      ),
    );
  }
}
