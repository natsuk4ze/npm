import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:npm/features/settings/language.dart';
import 'package:npm/features/settings/dark_mode.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settingsPage.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).hoverColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              shrinkWrap: true,
              children: const [
                _LanguageItem(),
                Divider(),
                _DarkModeItem(),
                Divider(),
                _ReportItem(),
                Divider(),
                _LicenseItem(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LanguageItem extends ConsumerWidget {
  const _LanguageItem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);

    return _Item(
      icon: Icons.language,
      title: l10n.settingsPage.language,
      trailing: const Icon(Icons.arrow_forward),
      onTap: () async => _showDialog(context, ref),
    );
  }

  Future<void> _showDialog(BuildContext context, WidgetRef ref) async =>
      showDialog(
        context: context,
        builder: (context) => SimpleDialog(children: [
          for (var lang in LanguageType.values)
            RadioListTile(
              title: Text(lang.toString()),
              value: lang,
              groupValue: ref.watch(languageProvider),
              onChanged: (value) {
                ref.read(languageProvider.notifier).update(value!);
                context.pop();
              },
            )
        ]),
      );
}

class _DarkModeItem extends ConsumerWidget {
  const _DarkModeItem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final isDarkMode = ref.watch(isDarkModeProvider);

    return _Item(
      icon: Icons.light_mode,
      title: l10n.settingsPage.darkMode,
      trailing: Switch(
        value: isDarkMode,
        onChanged: (_) => ref.read(isDarkModeProvider.notifier).swich(),
      ),
      onTap: () => ref.read(isDarkModeProvider.notifier).swich(),
    );
  }
}

class _ReportItem extends ConsumerWidget {
  const _ReportItem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);

    return _Item(
      icon: Icons.report,
      title: l10n.settingsPage.report,
      trailing: const Icon(Icons.arrow_forward),
      onTap: () async =>
          launchUrl(Uri.parse('https://github.com/natsuk4ze/npm/issues')),
    );
  }
}

class _LicenseItem extends ConsumerWidget {
  const _LicenseItem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);

    return _Item(
      icon: Icons.star,
      title: l10n.settingsPage.license,
      trailing: const Icon(Icons.arrow_forward),
      onTap: () async => launchUrl(
          Uri.parse('https://github.com/natsuk4ze/npm/blob/master/LICENSE')),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    required this.icon,
    required this.title,
    required this.trailing,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final Widget trailing;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: SizedBox(
        height: 40,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(icon),
              const Gap(20),
              Text(title),
              const Spacer(),
              const Gap(20),
              trailing,
            ],
          ),
        ),
      ),
    );
  }
}
