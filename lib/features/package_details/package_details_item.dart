import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:markdown_widget/config/configs.dart';
import 'package:markdown_widget/widget/markdown.dart';
import 'package:npm/common_widgets/widget_or_shrink.dart';
import 'package:npm/features/package_details/package_details.dart';
import 'package:npm/features/settings/dark_mode.dart';
import 'package:npm/features/settings/language.dart';
import 'package:npm/common_widgets/link_text.dart';

class PackegeDetailsItem extends StatelessWidget {
  const PackegeDetailsItem(this.package, {super.key});

  final PackageDetails package;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Name(package.name),
          _Description(package.description),
          _Homepage(package.homepage),
          _Repository(package.repository),
          _Readme(package.readme),
          _Keywords(package.keywords),
          _License(package.license),
          const Gap(20),
        ],
      ),
    );
  }
}

class _Name extends StatelessWidget {
  const _Name(this.name);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        name,
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description(this.description);

  final String? description;

  @override
  Widget build(BuildContext context) {
    return WidgetOrShrink(
      data: description,
      builder: (description) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(
          description,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}

class _Homepage extends ConsumerWidget {
  const _Homepage(this.homepage);

  final String? homepage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);

    return _InfoTile(
      data: homepage,
      title: l10n.packageDetailsPage.homepage,
      icon: Icons.home_outlined,
      contentBuilder: (homepage) => LinkText(homepage),
    );
  }
}

class _Repository extends ConsumerWidget {
  const _Repository(this.repository);

  final String? repository;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);

    return _InfoTile(
      data: repository,
      title: l10n.packageDetailsPage.repository,
      icon: Icons.source_outlined,
      contentBuilder: (repository) => LinkText(repository),
    );
  }
}

class _Readme extends ConsumerWidget {
  const _Readme(this.readme);

  final String? readme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);

    return _InfoTile(
      data: readme,
      title: 'Readme',
      icon: Icons.description_outlined,
      contentBuilder: (readme) => MarkdownWidget(
        config: isDarkMode
            ? MarkdownConfig.darkConfig
            : MarkdownConfig.defaultConfig,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        data: readme,
      ),
    );
  }
}

class _Keywords extends ConsumerWidget {
  const _Keywords(this.keywords);
  final List<String>? keywords;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);

    return _InfoTile(
      title: l10n.packageDetailsPage.keywords,
      icon: Icons.label_outline,
      data: keywords,
      contentBuilder: (keywords) => Wrap(
        spacing: 8,
        runSpacing: 4,
        children: List.generate(keywords.length, (i) => Text(keywords[i])),
      ),
    );
  }
}

class _License extends ConsumerWidget {
  const _License(this.license);

  final String? license;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);

    return _InfoTile(
      data: license,
      contentBuilder: (license) => Text(license),
      title: l10n.packageDetailsPage.license,
      icon: Icons.star_border,
    );
  }
}

class _InfoTile<T> extends StatelessWidget {
  const _InfoTile({
    required this.data,
    required this.contentBuilder,
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;
  final T? data;
  final Widget Function(T value) contentBuilder;

  @override
  Widget build(BuildContext context) {
    return WidgetOrShrink(
      data: data,
      builder: (data) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon),
              const Gap(8),
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
          const Gap(6),
          contentBuilder(data),
          const Divider(),
          const Gap(8),
        ],
      ),
    );
  }
}
