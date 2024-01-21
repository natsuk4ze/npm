import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:npm/features/packages/packages.dart';
import 'package:npm/features/score/score.dart';
import 'package:npm/features/score/score_bar.dart';
import 'package:npm/features/settings/language.dart';
import 'package:npm/router.dart';
import 'package:npm/widgets/logo.dart';
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
    final scrollController = useScrollController();
    final l10n = ref.watch(l10nProvider);
    final isLargeScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
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
        title: Row(
          children: [
            const Gap(20),
            GestureDetector(
              onTap: () => scrollController.jumpTo(0),
              child: const Logo(width: 60),
            ),
            const Gap(20),
            Flexible(
              child: SearchBar(
                hintText: l10n.packagesPage.searchPackages,
                controller: searchController,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: isLargeScreen
            ? Row(
                children: [
                  const _SortPannel(),
                  const VerticalDivider(),
                  Expanded(
                    child: _PackageItems(
                      searchText: searchController.text,
                    ),
                  ),
                ],
              )
            : NestedScrollView(
                controller: scrollController,
                headerSliverBuilder: (_, __) => [
                  const SliverAppBar(
                      surfaceTintColor: Colors.transparent,
                      toolbarHeight: 200,
                      title: SizedBox(
                          width: double.maxFinite, child: _SortPannel()))
                ],
                body: Center(
                    child: _PackageItems(searchText: searchController.text)),
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
          style: const TextStyle(fontSize: 14),
        ),
        const Gap(8),
        for (var score in ScoreType.values)
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => sort == score
                ? ref.invalidate(sortProvider)
                : ref.read(sortProvider.notifier).update(score),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 16,
                      child: Transform.scale(
                        scale: 0.7,
                        child: Radio(
                          activeColor: score.color,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          value: score,
                          groupValue: sort,
                          onChanged: (_) {},
                        ),
                      ),
                    ),
                    const Gap(12),
                    Text(
                      score.transltate(l10n),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                Divider(color: score.color)
              ],
            ),
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

    return packages.when(
      data: (packages) {
        final sortedPackages = sort == null
            ? List.of(packages)
            : packages.sortedByCompare(
                (package) => sort.getValue(package.score),
                (a, b) => b.compareTo(a));

        return sortedPackages.isEmpty
            ? const _EmptyItem()
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
    );
  }
}

@visibleForTesting
class PackageItem extends ConsumerWidget {
  const PackageItem(this.package, {super.key});

  final Package package;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sort = ref.watch(sortProvider);
    final scores = sort == null
        ? ScoreType.values
        : (List.of(ScoreType.values)
          ..swap(0, ScoreType.values.indexWhere((score) => score == sort)));

    return InkWell(
      onTap: () => PackageDetailsRoute(id: package.name).go(context),
      child: ListTile(
        title: Wrap(
          spacing: 8,
          children: [
            Text(
              package.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('v${package.version}'),
          ],
        ),
        subtitle: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (package.description != null)
              Text(
                package.description!,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            if (package.keywords != null)
              SizedBox(
                height: 60,
                child: ListView.separated(
                  separatorBuilder: (_, __) => const Gap(8),
                  scrollDirection: Axis.horizontal,
                  itemCount: package.keywords!.length,
                  itemBuilder: (_, int i) => Chip(
                    label: Text(package.keywords![i]),
                    backgroundColor: Theme.of(context).hoverColor,
                    side: BorderSide.none,
                  ),
                ),
              ),
            for (var score in scores)
              ScoreBar(
                type: score,
                value: score.getValue(package.score),
              ),
          ],
        ),
      ),
    );
  }
}

class _EmptyItem extends ConsumerWidget {
  const _EmptyItem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/app/empty.png',
            width: 200,
          ),
          const Gap(20),
          Text(l10n.packagesPage.packageNotFound)
        ],
      ),
    );
  }
}
