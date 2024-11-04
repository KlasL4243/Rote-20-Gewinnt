// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'round.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Round _$RoundFromJson(Map<String, dynamic> json) => Round()
  ..bets = Map<String, int>.from(json['bets'] as Map)
  ..wins = Map<String, int>.from(json['wins'] as Map)
  ..scores = Map<String, int>.from(json['scores'] as Map);

Map<String, dynamic> _$RoundToJson(Round instance) => <String, dynamic>{
      'bets': instance.bets,
      'wins': instance.wins,
      'scores': instance.scores,
    };
