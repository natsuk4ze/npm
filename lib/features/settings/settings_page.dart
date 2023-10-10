import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:npm/features/settings/language.dart';
import 'package:npm/features/settings/theme.dart';
import 'package:npm/widgets/navigation_bar.dart';
import 'package:npm/widgets/link_text.dart';
import 'package:npm/widgets/responsive_scaffold.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);

    return ResponsiveScaffold(
      appBar: AppBar(
        title: Text(l10n.settingsPage.title),
      ),
      sideNavigationBar: const SideNaviBar(),
      bottomNavigationBar: const BottomNaviBar(),
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
      onTap: () async => _showDialog(context, ref),
    );
  }

  Future<void> _showDialog(BuildContext context, WidgetRef ref) async =>
      showDialog(
        context: context,
        builder: (context) => Dialog(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                    width: 4,
                  ),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: Image.asset('assets/app/owner.png').image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Gap(12),
              const LinkText(
                'https://github.com/natsuk4ze',
                text: 'Created by @natsuk4ze',
              ),
              const Gap(12),
              const Text(
                'Midori Design Studio',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        )),
      );
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
