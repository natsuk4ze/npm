import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:markdown_widget/config/configs.dart';
import 'package:markdown_widget/widget/markdown.dart';
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
          const Gap(4),
          _Description(package.description),
          const Gap(20),
          _Homepage(package.homepage),
          const Divider(),
          _Repository(package.repository),
          const Gap(40),
          _Readme(package.readme),
          const Gap(20),
          _Keywords(package.keywords),
          const Gap(20),
          _License(package.license),
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
    return Text(
      name,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}

class _Description extends StatelessWidget {
  const _Description(this.description);

  final String? description;

  @override
  Widget build(BuildContext context) {
    if (description == null) return const SizedBox.shrink();

    return Text(description!);
  }
}

class _Homepage extends ConsumerWidget {
  const _Homepage(this.homepage);

  final String? homepage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (homepage == null) return const SizedBox.shrink();
    final l10n = ref.watch(l10nProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(l10n.packageDetailsPage.homepage),
        const Gap(4),
        LinkText(homepage!)
      ],
    );
  }
}

class _Repository extends ConsumerWidget {
  const _Repository(this.repository);

  final String? repository;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (repository == null) return const SizedBox.shrink();
    final l10n = ref.watch(l10nProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(l10n.packageDetailsPage.repository),
        const Gap(4),
        LinkText(repository!)
      ],
    );
  }
}

class _Readme extends ConsumerWidget {
  const _Readme(this.readme);

  final String? readme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (readme == null) return const SizedBox.shrink();
    final isDarkMode = ref.watch(isDarkModeProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.description_outlined),
            Gap(8),
            Text('Readme'),
          ],
        ),
        const Divider(),
        MarkdownWidget(
          config: isDarkMode
              ? MarkdownConfig.darkConfig
              : MarkdownConfig.defaultConfig,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          data: readme!,
        )
      ],
    );
  }
}

class _Keywords extends StatelessWidget {
  const _Keywords(this.keywords);
  final List<String>? keywords;

  @override
  Widget build(BuildContext context) {
    if (keywords == null) return const SizedBox.shrink();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Keywords'),
        const Divider(),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: List.generate(keywords!.length, (i) => Text(keywords![i])),
        ),
      ],
    );
  }
}

class _License extends StatelessWidget {
  const _License(this.license);

  final String? license;

  @override
  Widget build(BuildContext context) {
    if (license == null) return const SizedBox.shrink();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('License'),
        const Divider(),
        Text(license!),
      ],
    );
  }
}
