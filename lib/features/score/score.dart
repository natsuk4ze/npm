import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:npm/features/packages/packages.dart';
import 'package:npm/i18n/strings.g.dart';

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

  String transltate(StringsEn translate) => switch (this) {
        popularity => translate.packagesPage.score.popularity,
        quality => translate.packagesPage.score.quality,
        maintenance => translate.packagesPage.score.maintenance,
      };

  static List<Package> sort(List<Package> packages, ScoreType type) =>
      List.of(packages)
        ..sort((a, b) => switch (type) {
              maintenance => b.score.maintenance.compareTo(a.score.maintenance),
              popularity => b.score.popularity.compareTo(a.score.popularity),
              quality => b.score.quality.compareTo(a.score.quality),
            });
}
