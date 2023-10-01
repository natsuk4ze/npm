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
          for (var item in _Items.values)
            BottomNavigationBarItem(
              icon: item.icon,
              label: item.label(translate),
            )
        ],
        onTap: (index) {
          switch (index) {
            case _ when index == _Items.settings.index:
              const SettingsRoute().go(context);
            default:
              const PackagesRoute().go(context);
          }
        },
        currentIndex: switch (path) {
          SettingsRoute.path => _Items.settings.index,
          _ => _Items.packages.index,
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
          PackagesRoute.path => _Items.packages.index,
          SettingsRoute.path => _Items.settings.index,
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
        onDestinationSelected: (index) {
          switch (index) {
            case _ when index == _Items.settings.index:
              const SettingsRoute().go(context);
            default:
              const PackagesRoute().go(context);
          }
        },
        destinations: [
          for (var item in _Items.values)
            (path == PackagesRoute.path && item == _Items.packages)
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
