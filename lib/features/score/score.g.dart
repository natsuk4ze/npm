// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScoreImpl _$$ScoreImplFromJson(Map<String, dynamic> json) => _$ScoreImpl(
      popularity: (json['popularity'] as num).toDouble(),
      quality: (json['quality'] as num).toDouble(),
      maintenance: (json['maintenance'] as num).toDouble(),
    );

Map<String, dynamic> _$$ScoreImplToJson(_$ScoreImpl instance) =>
    <String, dynamic>{
      'popularity': instance.popularity,
      'quality': instance.quality,
      'maintenance': instance.maintenance,
    };
