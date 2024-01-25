import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:npm/common_widgets/empty_image.dart';
import 'package:npm/common_widgets/logo_app_bar.dart';
import 'package:npm/features/settings/go_settings_button.dart';
import 'package:npm/util/extensions.dart';
import 'package:npm/features/packages/package_item.dart';
import 'package:npm/features/packages/packages.dart';
import 'package:npm/features/score/score.dart';
import 'package:npm/features/score/score_radio_tile.dart';
import 'package:npm/features/settings/language.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'packages_page.g.dart';

@visibleForTesting
const initialSearchText = 'vue';

@riverpod
class Sort extends _$Sort {
  @override
  ScoreType? build() => null;

  void update(ScoreType type) => state = type;
}

@riverpod
Future<List<Package>> sortedPackages(SortedPackagesRef ref,
    {required String search}) async {
  final packages = await ref.watch(packagesProvider(search: search).future);
  final sort = ref.watch(sortProvider);

  return sort == null
      ? List.of(packages)
      : packages.sortedByCompare(
          (package) => sort.getValue(package.score), (a, b) => b.compareTo(a));
}

class PackagesPage extends HookConsumerWidget {
  const PackagesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController(text: initialSearchText);
    useListenable(searchController);
    final l10n = ref.watch(l10nProvider);

    return Scaffold(
      appBar: LogoAppBar(
        trailing: const GoSettingsButton(),
        title: SearchBar(
          hintText: l10n.packagesPage.searchPackages,
          controller: searchController,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: context.isLargeScreen
            ? Row(
                children: [
                  const _SortPanel(),
                  const VerticalDivider(),
                  Expanded(
                    child: _PackageItems(searchText: searchController.text),
                  ),
                ],
              )
            : NestedScrollView(
                headerSliverBuilder: (_, __) => [
                  const SliverAppBar(
                    surfaceTintColor: Colors.transparent,
                    toolbarHeight: 200,
                    title: _SortPanel(),
                  )
                ],
                body: _PackageItems(searchText: searchController.text),
              ),
      ),
    );
  }
}

class _SortPanel extends ConsumerWidget {
  const _SortPanel();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final sort = ref.watch(sortProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.packagesPage.sortPackages,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const Gap(8),
        for (var score in ScoreType.values)
          ScoreRadioTile(
            type: score,
            groupeType: sort,
            onTap: (type) => sort == type
                ? ref.invalidate(sortProvider)
                : ref.read(sortProvider.notifier).update(type),
          ),
      ],
    );
  }
}

class _PackageItems extends ConsumerWidget {
  const _PackageItems({required this.searchText});

  final String searchText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packages = ref.watch(sortedPackagesProvider(search: searchText));
    final l10n = ref.watch(l10nProvider);

    return switch (packages) {
      AsyncData(:final value) => value.isEmpty
          ? SingleChildScrollView(
              child: EmptyImage(text: l10n.packagesPage.packageNotFound),
            )
          : RefreshIndicator(
              onRefresh: () => ref.refresh(packagesProvider(
                search: searchText,
                debounce: false,
              ).future),
              child: ListView.separated(
                separatorBuilder: (_, __) => const Divider(),
                itemCount: value.length,
                itemBuilder: (_, int i) => PackageItem(value[i]),
              ),
            ),
      AsyncError(:final error) => Text(error.toString()),
      _ => const Center(child: CircularProgressIndicator()),
    };
  }
}
