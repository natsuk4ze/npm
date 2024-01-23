import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:npm/features/score/score.dart';
import 'package:npm/features/settings/language.dart';

class ScoreRadioTile extends ConsumerWidget {
  const ScoreRadioTile({
    required this.type,
    required this.groupeType,
    required this.onTap,
    super.key,
  });

  final ScoreType type;
  final ScoreType? groupeType;
  final void Function(ScoreType type) onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onTap(type),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 16,
                child: IgnorePointer(
                  child: Radio(
                    activeColor: type.color,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: type,
                    groupValue: groupeType,
                    onChanged: (_) {},
                  ),
                ),
              ),
              const Gap(12),
              Text(
                type.transltate(l10n),
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
          Divider(color: type.color)
        ],
      ),
    );
  }
}
