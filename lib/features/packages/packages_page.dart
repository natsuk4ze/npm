import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:npm/features/packages/packages.dart';
import 'package:npm/features/score/score.dart';
import 'package:npm/features/score/score_bar.dart';
import 'package:npm/features/settings/language.dart';
import 'package:npm/router.dart';
import 'package:npm/widgets/logo.dart';
import 'package:npm/widgets/navigation_bar.dart';
import 'package:npm/widgets/responsive_scaffold.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'packages_page.g.dart';

@riverpod
class Sort extends _$Sort {
  @override
  Scores? build() => null;

  void update(Scores score) => state = score;
}

class PackagesPage extends HookConsumerWidget {
  const PackagesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController(text: 'color');
    useListenable(textController);
    final scrollController = useScrollController();
    final packages = ref.watch(packagesProvider(search: textController.text));
    final translate = ref.watch(translationProvider);
    final sort = ref.watch(sortProvider);
    final focus = FocusNode();

    return ResponsiveScaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        toolbarHeight: 80,
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
                hintText: translate.packagesPage.searchPackages,
                focusNode: focus,
                controller: textController,
                onSubmitted: (_) => focus.unfocus(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNaviBar(),
      sideNavigationBar: SideNaviBar(
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          onPressed: () => showDialog(
            context: context,
            builder: (context) => Dialog(
              child: SearchBar(
                hintText: translate.packagesPage.searchPackages,
                focusNode: focus..requestFocus(),
                controller: textController,
                leading: const Icon(Icons.search),
                onSubmitted: (_) => context.pop(),
              ),
            ),
          ),
          child: const Icon(Icons.search),
        ),
      ),
      child: NestedScrollView(
        controller: scrollController,
        headerSliverBuilder: (_, __) => [const _SortPannel()],
        body: Center(
          child: packages.when(
            data: (packages) {
              if (packages.isEmpty) return const _EmptyItem();

              List<Package>? sortedPackages;
              if (sort != null) {
                sortedPackages = List.of(packages);
                sortedPackages.sort((a, b) {
                  switch (sort) {
                    case Scores.maintenance:
                      return b.score.maintenance.compareTo(a.score.maintenance);
                    case Scores.popularity:
                      return b.score.popularity.compareTo(a.score.popularity);
                    case Scores.quality:
                      return b.score.quality.compareTo(a.score.quality);
                  }
                });
              }
              return RefreshIndicator(
                onRefresh: () async {
                  ref.invalidate(packagesProvider);
                  await ref.read(
                      packagesProvider(search: textController.text).future);
                },
                child: ListView.separated(
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: sortedPackages?.length ?? packages.length,
                  itemBuilder: (_, int i) =>
                      PackageItem(sortedPackages?[i] ?? packages[i]),
                ),
              );
            },
            error: (e, _) => Text(e.toString()),
            loading: () => const CircularProgressIndicator(),
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
            for (var score in Scores.values)
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
                          score.transltate(translate),
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
class PackageItem extends HookConsumerWidget {
  const PackageItem(this.package, {super.key});

  final Package package;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scores = useState(Scores.values.toList());
    ref.listen(sortProvider, (_, sort) {
      if (sort == null) return;
      scores.value = List.from(scores.value)
        ..sort((a, b) {
          if (a == sort) return -1;
          if (b == sort) return 1;
          return 0;
        });
    });

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
            for (var score in scores.value)
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
          Text(translate.packagesPage.packageNotFound)
        ],
      ),
    );
  }
}
