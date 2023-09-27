import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:npm/features/score/score.dart';

class ScoreBar extends StatelessWidget {
  const ScoreBar({
    required this.type,
    required this.value,
    super.key,
  });

  final ScoreType type;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 10,
          child: Text(
            type.toString(),
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
