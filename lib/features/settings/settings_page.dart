import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:npm/features/settings/settings.dart';
import 'package:npm/router.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translate = ref.watch(translationProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(translate.settingsPage.title),
      ),
      bottomNavigationBar: const BottomNaviBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade200,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    const _LanguageItem(),
                    const Divider(),
                    _BaseItem(
                      icon: Icons.light_mode,
                      leading: translate.settingsPage.darkMode,
                      trailing: Switch(value: true, onChanged: (_) {}),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
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
    return InkWell(
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
