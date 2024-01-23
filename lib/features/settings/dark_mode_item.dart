import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:npm/features/settings/dark_mode.dart';
import 'package:npm/features/settings/language.dart';
import 'package:npm/common_widgets/item_list_tile.dart';

class DarkModeItem extends ConsumerWidget {
  const DarkModeItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final isDarkMode = ref.watch(isDarkModeProvider);

    return ItemListTile(
      icon: Icons.light_mode,
      title: l10n.settingsPage.darkMode,
      trailing: IgnorePointer(
        child: Switch(
          value: isDarkMode,
          onChanged: (_) {},
        ),
      ),
      onTap: () async => ref.read(isDarkModeProvider.notifier).toggle(),
    );
  }
}
