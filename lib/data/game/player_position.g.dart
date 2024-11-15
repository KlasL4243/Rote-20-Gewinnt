// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_position.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerPosition _$PlayerPositionFromJson(Map<String, dynamic> json) =>
    PlayerPosition(
      player: json['player'] as String,
      score: (json['score'] as num).toInt(),
      position: (json['position'] as num).toInt(),
    );

Map<String, dynamic> _$PlayerPositionToJson(PlayerPosition instance) =>
    <String, dynamic>{
      'player': instance.player,
      'score': instance.score,
      'position': instance.position,
    };
