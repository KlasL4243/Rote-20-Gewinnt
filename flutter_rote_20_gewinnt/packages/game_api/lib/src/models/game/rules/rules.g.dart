// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rules.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rules _$RulesFromJson(Map<String, dynamic> json) => Rules(
      max_cards: (json['max_cards'] as num?)?.toInt(),
      points_round_win: (json['points_round_win'] as num?)?.toInt(),
      points_bet_win: (json['points_bet_win'] as num?)?.toInt(),
      points_bet_lose: (json['points_bet_lose'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RulesToJson(Rules instance) => <String, dynamic>{
      'max_cards': instance.max_cards,
      'points_round_win': instance.points_round_win,
      'points_bet_win': instance.points_bet_win,
      'points_bet_lose': instance.points_bet_lose,
    };
