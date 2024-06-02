import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:npm/common_widgets/fade_in.dart';
import 'package:npm/common_widgets/shrink_if_no_data.dart';
import 'package:npm/features/packages/packages.dart';
import 'package:npm/features/score/score.dart';
import 'package:npm/features/score/score_bar.dart';
import 'package:npm/router.dart';

class PackageItem extends StatelessWidget {
  const PackageItem(this.package, {super.key});

  final Package package;

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: InkWell(
        onTap: () => PackageDetailsRoute(id: package.name).go(context),
        child: ListTile(
          title: Wrap(
            spacing: 8,
            children: [
              _Name(package.name),
              _Version(package.version),
            ],
          ),
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Description(package.description),
              _Keywords(package.keywords),
              _ScoreBars(package.score),
            ],
          ),
        ),
      ),
    );
  }
}

class _Name extends StatelessWidget {
  const _Name(this.name);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }
}

class _Version extends StatelessWidget {
  const _Version(this.version);

  final String version;

  @override
  Widget build(BuildContext context) {
    return Text('v$version');
  }
}

class _Description extends StatelessWidget {
  const _Description(this.description);

  final String? description;

  @override
  Widget build(BuildContext context) {
    return ShrinkIfNoData(
      data: description,
      whenHasData: (description) => Text(
        description,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _Keywords extends StatelessWidget {
  const _Keywords(this.keywords);

  final List<String>? keywords;

  @override
  Widget build(BuildContext context) {
    return ShrinkIfNoData(
      data: keywords,
      whenHasData: (keywords) => SizedBox(
        height: 60,
        child: ListView.separated(
          separatorBuilder: (_, __) => const Gap(8),
          scrollDirection: Axis.horizontal,
          itemCount: keywords.length,
          itemBuilder: (_, int i) => Chip(
            label: Text(keywords[i]),
            backgroundColor: Theme.of(context).hoverColor,
            side: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class _ScoreBars extends StatelessWidget {
  const _ScoreBars(this.score);

  final Score score;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var score in ScoreType.values)
          ScoreBar(
            type: score,
            value: score.getValue(this.score),
          ),
      ],
    );
  }
}
