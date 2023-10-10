import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:npm/features/score/score.dart';
import 'package:npm/features/settings/language.dart';

class ScoreBar extends ConsumerWidget {
  const ScoreBar({
    required this.type,
    required this.value,
    super.key,
  });

  final ScoreType type;
  final double value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 12,
          child: Text(
            type.transltate(l10n)[0],
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ),
        const Gap(8),
        Container(
          width: 120,
          height: 10,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                type.color,
                type.color,
                Colors.transparent,
                Colors.transparent,
              ],
              stops: [0.0, value, value, 1.0],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ],
    );
  }
}
