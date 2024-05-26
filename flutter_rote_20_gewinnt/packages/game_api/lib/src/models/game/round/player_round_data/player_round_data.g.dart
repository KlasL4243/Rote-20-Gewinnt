// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_round_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerRoundData _$PlayerRoundDataFromJson(Map<String, dynamic> json) =>
    PlayerRoundData(
      player: json['player'] as String,
      bet: (json['bet'] as num?)?.toInt(),
      wins: (json['wins'] as num?)?.toInt(),
      score: (json['score'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PlayerRoundDataToJson(PlayerRoundData instance) =>
    <String, dynamic>{
      'player': instance.player,
      'bet': instance.bet,
      'wins': instance.wins,
      'score': instance.score,
    };
