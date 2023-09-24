import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:npm/features/packages/packages.dart';
import 'package:npm/features/score/score.dart';
import 'package:npm/features/score/score_bar.dart';
import 'package:npm/router.dart';

class PackagesPage extends HookConsumerWidget {
  const PackagesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController(text: 'color');
    final packages = ref.watch(packagesProvider(search: controller.text));
    final focus = FocusNode();
    useListenable(controller);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 60,
                    child: Image.asset('assets/npm.png'),
                  ),
                  const Gap(20),
                  Expanded(
                      child: SearchBar(
                    hintText: 'Search packages',
                    focusNode: focus,
                    controller: controller,
                    onSubmitted: (_) => focus.unfocus(),
                  )),
                ],
              ),
              const Gap(20),
              Expanded(
                child: packages.when(
                  data: (packages) {
                    if (packages.isEmpty) return const _EmptyItem();
                    return RefreshIndicator(
                      onRefresh: () async {
                        ref.invalidate(packagesProvider);
                        await ref.read(
                            packagesProvider(search: controller.text).future);
                      },
                      child: ListView.separated(
                        separatorBuilder: (_, __) => const Divider(),
                        itemCount: packages.length,
                        itemBuilder: (_, int i) => PackageItem(packages[i]),
                      ),
                    );
                  },
                  error: (e, _) => Center(child: Text(e.toString())),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

@visibleForTesting
class PackageItem extends StatelessWidget {
  const PackageItem(this.package, {super.key});

  final Package package;

  @override
  Widget build(BuildContext context) {
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
                        backgroundColor: Colors.grey.shade200,
                        side: BorderSide.none,
                      ),
                    ),
                  ),
            ScoreBar(
              type: ScoreType.popularity,
              value: package.score.popularity,
            ),
            ScoreBar(
              type: ScoreType.quality,
              value: package.score.quality,
            ),
            ScoreBar(
              type: ScoreType.maintenance,
              value: package.score.maintenance,
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyItem extends StatelessWidget {
  const _EmptyItem();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/empty.png',
          width: 200,
        ),
        const Gap(20),
        const Text('Package not found.')
      ],
    );
  }
}
