import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:npm/features/settings/language.dart';
import 'package:npm/features/settings/theme.dart';
import 'package:npm/router.dart';
import 'package:npm/widgets/link_text.dart';
import 'package:npm/widgets/safe_scaffold_padding.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translate = ref.watch(translationProvider);
    return SafeScaffoldPadding(
      appBar: AppBar(
        title: Text(translate.settingsPage.title),
      ),
      bottomNavigationBar: const BottomNaviBar(),
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Container(
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
                  ],
                ),
              ),
            ),
            const Gap(80),
            const _Lecense(),
          ],
        ),
      ),
    );
  }
}

class _LanguageItem extends ConsumerWidget {
  const _LanguageItem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLang = ref.watch(languageProvider);
    final translate = ref.watch(translationProvider);
    return _BaseItem(
      icon: Icons.language,
      leading: translate.settingsPage.language,
      title: currentLang.toString(),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () => showDialog(
        context: context,
        builder: (context) => SimpleDialog(children: [
          for (var lang in LanguageType.values)
            RadioListTile(
              title: Text(lang.toString()),
              value: lang,
              groupValue: currentLang,
              onChanged: (value) {
                ref.read(languageProvider.notifier).update(value!);
                context.pop();
              },
            )
        ]),
      ),
    );
  }
}

class _DarkModeItem extends ConsumerWidget {
  const _DarkModeItem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translate = ref.watch(translationProvider);
    final darkMode = ref.watch(darkModeProvider);

    return _BaseItem(
      icon: Icons.light_mode,
      leading: translate.settingsPage.darkMode,
      trailing: Switch(
          value: darkMode,
          onChanged: (_) => ref.read(darkModeProvider.notifier).swich()),
      onTap: () {},
    );
  }
}

class _ReportItem extends ConsumerWidget {
  const _ReportItem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translate = ref.watch(translationProvider);

    return _BaseItem(
      icon: Icons.report,
      leading: translate.settingsPage.report,
      trailing: const Icon(Icons.arrow_forward),
      onTap: () async =>
          launchUrl(Uri.parse('https://github.com/natsuk4ze/npm/issues')),
    );
  }
}

class _Lecense extends StatelessWidget {
  const _Lecense();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).dividerColor,
              width: 4,
            ),
            shape: BoxShape.circle,
            image: DecorationImage(
              image: Image.asset('assets/owner.png').image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Gap(20),
        const LinkText(
          'https://github.com/natsuk4ze',
          text: 'Created by @natsuk4ze',
        ),
        const Gap(12),
        const Text(
          'Midori Design Studio',
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}

class _BaseItem extends StatelessWidget {
  const _BaseItem({
    required this.icon,
    required this.leading,
    this.title,
    required this.trailing,
    required this.onTap,
  });

  final IconData icon;
  final String leading;
  final String? title;
  final Widget trailing;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 40,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(icon),
              const Gap(20),
              Text(leading),
              const Spacer(),
              if (title != null) Text(title!),
              const Gap(20),
              trailing,
            ],
          ),
        ),
      ),
    );
  }
}
