import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:npm/features/packages/packages.dart';
import 'package:npm/features/score/score.dart';
import 'package:npm/features/score/score_bar.dart';
import 'package:npm/features/settings/language.dart';
import 'package:npm/features/settings/theme.dart';
import 'package:npm/router.dart';
import 'package:npm/widgets/safe_scaffold_padding.dart';
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
    final controller = useTextEditingController(text: 'color');
    final packages = ref.watch(packagesProvider(search: controller.text));
    final translate = ref.watch(translationProvider);
    final darkMode = ref.watch(darkModeProvider);
    final sort = ref.watch(sortProvider);
    final focus = FocusNode();
    useListenable(controller);

    return SafeScaffoldPadding(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        toolbarHeight: 80,
        title: Row(
          children: [
            SizedBox(
              width: 60,
              child: Image.asset(
                'assets/app/npm.png',
                color: darkMode ? Colors.white : null,
              ),
            ),
            const Gap(20),
            Expanded(
                child: SearchBar(
              hintText: translate.packagesPage.searchPackages,
              focusNode: focus,
              controller: controller,
              onSubmitted: (_) => focus.unfocus(),
            )),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNaviBar(),
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, _) => [const _SortPannel()],
        body: packages.when(
          data: (packages) {
            if (packages.isEmpty) return const _EmptyItem();
            List<Package>? sortedPackages;
            if (sort != null) {
              sortedPackages = List.from(packages);
              sortedPackages.sort((a, b) {
                switch (sort) {
                  case ScoreType.maintenance:
                    return b.score.maintenance.compareTo(a.score.maintenance);
                  case ScoreType.popularity:
                    return b.score.popularity.compareTo(a.score.popularity);
                  case ScoreType.quality:
                    return b.score.quality.compareTo(a.score.quality);
                }
              });
            }
            return RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(packagesProvider);
                await ref
                    .read(packagesProvider(search: controller.text).future);
              },
              child: ListView.separated(
                separatorBuilder: (_, __) => const Divider(),
                itemCount: sortedPackages?.length ?? packages.length,
                itemBuilder: (_, int i) =>
                    PackageItem(sortedPackages?[i] ?? packages[i]),
              ),
            );
          },
          error: (e, _) => Center(child: Text(e.toString())),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}

class _SortPannel extends ConsumerWidget {
  const _SortPannel();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translate = ref.watch(translationProvider);
    final sort = ref.watch(sortProvider);

    return SliverAppBar(
      surfaceTintColor: Colors.transparent,
      toolbarHeight: 200,
      title: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              translate.packagesPage.sortPackages,
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
                          score.transltate(ref),
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
        ),
      ),
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
    List<ScoreType> scoreTypes = ScoreType.values.toList();
    if (sort != null) {
      scoreTypes.sort((a, b) {
        if (a == sort) return -1;
        if (b == sort) return 1;
        return 0;
      });
    }

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
            Text(
              package.description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            package.keywords.isEmpty
                ? const SizedBox.shrink()
                : SizedBox(
                    height: 60,
                    child: ListView.separated(
                      separatorBuilder: (_, __) => const Gap(8),
                      scrollDirection: Axis.horizontal,
                      itemCount: package.keywords.length,
                      itemBuilder: (_, int i) => Chip(
                        label: Text(package.keywords[i]),
                        backgroundColor: Theme.of(context).hoverColor,
                        side: BorderSide.none,
                      ),
                    ),
                  ),
            for (var score in scoreTypes)
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
    final translate = ref.watch(translationProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/app/empty.png',
          width: 200,
        ),
        const Gap(20),
        Text(translate.packagesPage.packageNotFound)
      ],
    );
  }
}
