import 'dart:developer';

import 'package:collection/collection.dart';
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
  ScoreType? build() => null;

  void update(ScoreType type) => state = type;
}

@riverpod
Raw<TextEditingController> searchController(SearchControllerRef ref) {
  final controller = TextEditingController(text: 'color');
  ref.onDispose(controller.dispose);
  return controller;
}

class PackagesPage extends HookConsumerWidget {
  const PackagesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = ref.watch(searchControllerProvider);
    useListenable(searchController);
    final scrollController = useScrollController();
    final packages = ref.watch(packagesProvider(search: searchController.text));
    final translate = ref.watch(translationProvider);
    final focus = useFocusNode();

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
                controller: searchController,
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
                controller: searchController,
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
            data: (packages) => packages.isEmpty
                ? const _EmptyItem()
                : _PackageItems(packages: packages),
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

class _PackageItems extends HookConsumerWidget {
  const _PackageItems({required this.packages});

  final List<Package> packages;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = ref.watch(searchControllerProvider);
    final sort = ref.watch(sortProvider);
    final sortedPackages =
        sort == null ? List.of(packages) : ScoreType.sort(packages, sort);

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(packagesProvider);
        await ref.read(packagesProvider(search: searchController.text).future);
      },
      child: ListView.separated(
        separatorBuilder: (_, __) => const Divider(),
        itemCount: sortedPackages.length,
        itemBuilder: (_, int i) => PackageItem(sortedPackages[i]),
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
