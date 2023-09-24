import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:npm/features/package_details/package_details.dart';
import 'package:npm/features/settings/language.dart';
import 'package:npm/features/settings/theme.dart';
import 'package:npm/widgets/link_text.dart';

class PackageDetailsPage extends ConsumerWidget {
  const PackageDetailsPage({required this.id, super.key});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final package = ref.watch(packageDetailsProvider(id: id));
    final translate = ref.watch(translationProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(translate.packageDetailsPage.title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: package.when(
            data: (package) => PackegeDetailsItem(package),
            error: (e, _) => Center(child: Text(e.toString())),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}

@visibleForTesting
class PackegeDetailsItem extends ConsumerWidget {
  const PackegeDetailsItem(this.package, {super.key});

  final PackageDetails package;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translate = ref.watch(translationProvider);
    final darkMode = ref.watch(darkModeProvider);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            package.name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            package.description,
          ),
          const Gap(20),
          Text(translate.packageDetailsPage.homepage),
          LinkText(package.homepage),
          const Divider(),
          Text(translate.packageDetailsPage.repository),
          LinkText(package.repository.replaceAll('git+', '')),
          const Gap(40),
          const Row(
            children: [
              Icon(Icons.description_outlined),
              Gap(8),
              Text('Readme'),
            ],
          ),
          const Divider(),
          MarkdownWidget(
            config: darkMode
                ? MarkdownConfig.darkConfig
                : MarkdownConfig.defaultConfig,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            data: package.readme,
          ),
          const Gap(20),
          const Text('Keywords'),
          const Divider(),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: List.generate(
                package.keywords.length, (i) => Text(package.keywords[i])),
          ),
        ],
      ),
    );
  }
}
