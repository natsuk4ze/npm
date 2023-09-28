import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:npm/features/settings/language.dart';
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
