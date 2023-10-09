import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:npm/features/package_details/package_details.dart';
import 'package:npm/features/settings/language.dart';
import 'package:npm/features/settings/theme.dart';
import 'package:npm/widgets/navigation_bar.dart';
import 'package:npm/widgets/link_text.dart';
import 'package:npm/widgets/responsive_scaffold.dart';
import 'package:npm/widgets/widget_or_empty.dart';

class PackageDetailsPage extends ConsumerWidget {
  const PackageDetailsPage({
    required this.id,
    super.key,
  });

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final package = ref.watch(packageDetailsProvider(id: id));
    final translate = ref.watch(translationProvider);

    return ResponsiveScaffold(
      appBar: AppBar(
        title: Text(translate.packageDetailsPage.title),
      ),
      sideNavigationBar: const SideNaviBar(),
      child: package.when(
        data: (package) => PackegeDetailsItem(package),
        error: (e, _) => Center(child: Text(e.toString())),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

@visibleForTesting
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
          const Gap(20),
          _HomePage(package.homepage),
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
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description(this.description);

  final String? description;

  @override
  Widget build(BuildContext context) {
    return WidgetOrEmpty(
      shouldEmpty: description == null,
      child: Text(description!),
    );
  }
}

class _HomePage extends ConsumerWidget {
  const _HomePage(this.homepage);

  final String? homepage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translate = ref.watch(translationProvider);

    return WidgetOrEmpty(
      shouldEmpty: homepage == null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(translate.packageDetailsPage.homepage),
          const Gap(4),
          LinkText(homepage!)
        ],
      ),
    );
  }
}

class _Repository extends ConsumerWidget {
  const _Repository(this.repository);

  final String? repository;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translate = ref.watch(translationProvider);

    return WidgetOrEmpty(
      shouldEmpty: repository == null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(translate.packageDetailsPage.repository),
          const Gap(4),
          LinkText(repository!)
        ],
      ),
    );
  }
}

class _Readme extends ConsumerWidget {
  const _Readme(this.readme);

  final String? readme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);

    return WidgetOrEmpty(
      shouldEmpty: readme == null,
      child: Column(
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
      ),
    );
  }
}

class _Keywords extends StatelessWidget {
  const _Keywords(this.keywords);
  final List<String>? keywords;

  @override
  Widget build(BuildContext context) {

    return WidgetOrEmpty(
      shouldEmpty: keywords == null,
      child: Column(
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
      ),
    );
  }
}

class _License extends StatelessWidget {
  const _License(this.license);

  final String? license;

  @override
  Widget build(BuildContext context) {

    return WidgetOrEmpty(
      shouldEmpty: license == null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('License'),
          const Divider(),
          Text(license!),
        ],
      ),
    );
  }
}
