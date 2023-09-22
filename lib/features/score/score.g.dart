// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Score _$$_ScoreFromJson(Map<String, dynamic> json) => _$_Score(
      popularity: (json['popularity'] as num).toDouble(),
      quality: (json['quality'] as num).toDouble(),
      maintenance: (json['maintenance'] as num).toDouble(),
    );

Map<String, dynamic> _$$_ScoreToJson(_$_Score instance) => <String, dynamic>{
      'popularity': instance.popularity,
      'quality': instance.quality,
      'maintenance': instance.maintenance,
    };
