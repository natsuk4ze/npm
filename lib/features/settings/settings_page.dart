import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:npm/features/settings/dark_mode_item.dart';
import 'package:npm/features/settings/language.dart';
import 'package:npm/features/settings/language_item.dart';
import 'package:npm/common_widgets/title_app_bar.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);

    return Scaffold(
      appBar: TitleAppBar(title: l10n.settingsPage.title),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).hoverColor,
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                LanguageItem(),
                Divider(),
                DarkModeItem(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
