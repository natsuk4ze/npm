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
          child: Center(
            child: package.when(
              data: (package) => _PackegeItem(package),
              error: (e, _) => Text(e.toString()),
              loading: () => const CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}

class _PackegeItem extends ConsumerWidget {
  const _PackegeItem(this.package);

  final PackageDetails package;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          package.name,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Gap(20),
        const Text('Homepage'),
        GestureDetector(
          onTap: () => launchUrl(Uri.parse(package.homepage)),
          child: Text(
            package.homepage,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        const Gap(20),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: List.generate(package.keywords.length,
              (i) => Chip(label: Text(package.keywords[i]))),
        ),
        const Gap(20),
        const Row(
          children: [
            Icon(Icons.description_outlined),
            Gap(8),
            Text('Readme'),
          ],
        ),
        const Divider(),
        Expanded(
          child: MarkdownWidget(
            data: package.readme,
          ),
        ),
      ],
    );
  }
}