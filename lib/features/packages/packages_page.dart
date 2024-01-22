import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:npm/common_widgets/empty_image.dart';
import 'package:npm/util/extensions.dart';
import 'package:npm/features/packages/package_item.dart';
import 'package:npm/features/packages/packages.dart';
import 'package:npm/features/score/score.dart';
import 'package:npm/features/score/score_radio_tile.dart';
import 'package:npm/features/settings/language.dart';
import 'package:npm/router.dart';
import 'package:npm/common_widgets/logo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'packages_page.g.dart';

@riverpod
class Sort extends _$Sort {
  @override
  ScoreType? build() => null;

  void update(ScoreType type) => state = type;
}

class PackagesPage extends HookConsumerWidget {
  const PackagesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController(text: 'color');
    useListenable(searchController);
    final l10n = ref.watch(l10nProvider);

    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Logo(),
        ),
        leadingWidth: 80,
        surfaceTintColor: Colors.transparent,
        toolbarHeight: 80,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton.outlined(
              onPressed: () => const SettingsRoute().go(context),
              icon: const Icon(Icons.settings),
            ),
          ),
        ],
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
                  const _SortPannel(),
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
                    title: SizedBox(
                      width: double.maxFinite,
                      child: _SortPannel(),
                    ),
                  )
                ],
                body: Center(
                  child: _PackageItems(searchText: searchController.text),
                ),
              ),
      ),
    );
  }
}

class _SortPannel extends ConsumerWidget {
  const _SortPannel();

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
    final packages = ref.watch(packagesProvider(search: searchText));
    final sort = ref.watch(sortProvider);
    final l10n = ref.watch(l10nProvider);

    return Center(
      child: packages.when(
        data: (packages) {
          final sortedPackages = sort == null
              ? List.of(packages)
              : packages.sortedByCompare(
                  (package) => sort.getValue(package.score),
                  (a, b) => b.compareTo(a));

          return sortedPackages.isEmpty
              ? SingleChildScrollView(
                  child: EmptyImage(text: l10n.packagesPage.packageNotFound),
                )
              : RefreshIndicator(
                  onRefresh: () async => ref.refresh(packagesProvider(
                    search: searchText,
                    debounce: false,
                  ).future),
                  child: ListView.separated(
                    separatorBuilder: (_, __) => const Divider(),
                    itemCount: sortedPackages.length,
                    itemBuilder: (_, int i) => PackageItem(sortedPackages[i]),
                  ),
                );
        },
        error: (e, _) => Text(e.toString()),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
