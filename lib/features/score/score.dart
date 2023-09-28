import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:npm/features/settings/language.dart';

part 'score.freezed.dart';
part 'score.g.dart';

@freezed
abstract class Score with _$Score {
  factory Score({
    required final double popularity,
    required final double quality,
    required final double maintenance,
  }) = _Score;
  factory Score.fromJson(Map<String, dynamic> json) => _$ScoreFromJson(json);
}

enum ScoreType {
  popularity,
  quality,
  maintenance;

  Color get color => switch (this) {
        popularity => Colors.lightBlue.shade200,
        quality => Colors.purple.shade200,
        maintenance => Colors.red.shade200,
      };

  double getValue(Score score) => switch (this) {
        popularity => score.popularity,
        quality => score.quality,
        maintenance => score.maintenance,
      };

  String transltate(WidgetRef ref) {
    final translate = ref.read(translationProvider);
    return switch (this) {
      popularity => translate.packagesPage.score.popularity,
      quality => translate.packagesPage.score.quality,
      maintenance => translate.packagesPage.score.maintenance,
    };
  }
}
