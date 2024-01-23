import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:npm/features/package_details/package_details.dart';
import 'package:npm/features/package_details/package_details_item.dart';
import 'package:npm/features/settings/language.dart';
import 'package:npm/common_widgets/title_app_bar.dart';

class PackageDetailsPage extends ConsumerWidget {
  const PackageDetailsPage({
    required this.id,
    super.key,
  });

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final package = ref.watch(packageDetailsProvider(id: id));
    final l10n = ref.watch(l10nProvider);

    return Scaffold(
      appBar: TitleAppBar(title: l10n.packageDetailsPage.title),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: package.when(
          data: (package) => PackegeDetailsItem(package),
          error: (e, _) => Text(e.toString()),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
