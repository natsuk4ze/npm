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

class PackageDetailsPage extends ConsumerWidget {
  const PackageDetailsPage({required this.id, super.key});

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
class PackegeDetailsItem extends ConsumerWidget {
  const PackegeDetailsItem(this.package, {super.key});

  final PackageDetails package;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translate = ref.watch(translationProvider);
    final darkMode = ref.watch(darkModeProvider);
    const unknown = 'unknown';

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
          if (package.description != null) Text(package.description!),
          const Gap(20),
          Text(translate.packageDetailsPage.homepage),
          const Gap(4),
          package.homepage != null
              ? LinkText(package.homepage!)
              : const Text(unknown),
          const Divider(),
          Text(translate.packageDetailsPage.repository),
          const Gap(4),
          package.repository != null
              ? LinkText(package.repository!)
              : const Text(unknown),
          const Gap(40),
          const Row(
            children: [
              Icon(Icons.description_outlined),
              Gap(8),
              Text('Readme'),
            ],
          ),
          const Divider(),
          package.readme != null
              ? MarkdownWidget(
                  config: darkMode
                      ? MarkdownConfig.darkConfig
                      : MarkdownConfig.defaultConfig,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  data: package.readme!,
                )
              : const Text(unknown),
          const Gap(20),
          const Text('Keywords'),
          const Divider(),
          if (package.keywords != null)
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: List.generate(
                  package.keywords!.length, (i) => Text(package.keywords![i])),
            ),
          const Gap(20),
          const Text('License'),
          const Divider(),
          Text(package.license ?? unknown)
        ],
      ),
    );
  }
}
