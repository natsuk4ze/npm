import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:npm/features/settings/language.dart';
import 'package:npm/common_widgets/item_list_tile.dart';

class LanguageItem extends ConsumerWidget {
  const LanguageItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);

    return ItemListTile(
      icon: Icons.language,
      title: l10n.settingsPage.language,
      trailing: const Icon(Icons.arrow_forward),
      onTap: () async => _SelectionDialog.show(context),
    );
  }
}

class _SelectionDialog extends ConsumerWidget {
  const _SelectionDialog._();

  static Future<void> show(BuildContext context) async => showDialog(
        context: context,
        builder: (context) => const _SelectionDialog._(),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLang = ref.watch(languageProvider);

    return SimpleDialog(children: [
      for (var lang in LanguageType.values)
        RadioListTile(
          title: Text(lang.toString()),
          value: lang,
          groupValue: currentLang,
          onChanged: (value) async {
            await ref.read(languageProvider.notifier).update(value!);
            if (context.mounted) context.pop();
          },
        )
    ]);
  }
}
