import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:markdown_widget/widget/markdown.dart';
import 'package:npm/features/package_details/package_details.dart';
import 'package:url_launcher/url_launcher.dart';

class PackageDetailsPage extends ConsumerWidget {
  const PackageDetailsPage({required this.id, super.key});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final package = ref.watch(packageDetailsProvider(id: id));
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: const Text(
          'Details',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
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

// Keep public for testing.
class PackegeDetailsItem extends ConsumerWidget {
  const PackegeDetailsItem(this.package, {super.key});

  final PackageDetails package;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          const Text('Homepage'),
          _linkText(package.homepage),
          const Divider(),
          const Text('Repository'),
          _linkText(package.repository.replaceAll('git+', '')),
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

  Widget _linkText(String text) => GestureDetector(
        onTap: () => launchUrl(Uri.parse(text)),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ),
      );
}
