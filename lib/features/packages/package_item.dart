import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:npm/features/packages/packages.dart';
import 'package:npm/features/score/score.dart';
import 'package:npm/features/score/score_bar.dart';
import 'package:npm/router.dart';

class PackageItem extends ConsumerWidget {
  const PackageItem(this.package, {super.key});

  final Package package;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

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
            for (var score in ScoreType.values)
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