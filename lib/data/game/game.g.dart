// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) => Game()
  ..name = json['name'] as String
  ..maxCards = (json['maxCards'] as num).toInt()
  ..onWin = (json['onWin'] as num).toInt()
  ..onLoose = (json['onLoose'] as num).toInt()
  ..onRoundWin = (json['onRoundWin'] as num).toInt()
  ..players =
      (json['players'] as List<dynamic>).map((e) => e as String).toList()
  ..cardCounts = (json['cardCounts'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList()
  ..data = (json['data'] as List<dynamic>)
      .map((e) => Round.fromJson(e as Map<String, dynamic>))
      .toList()
  ..currentIndex = (json['currentIndex'] as num).toInt()
  ..sortedPlayers =
      (json['sortedPlayers'] as List<dynamic>).map((e) => e as String).toList();

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'name': instance.name,
      'maxCards': instance.maxCards,
      'onWin': instance.onWin,
      'onLoose': instance.onLoose,
      'onRoundWin': instance.onRoundWin,
      'players': instance.players,
      'cardCounts': instance.cardCounts,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'currentIndex': instance.currentIndex,
      'sortedPlayers': instance.sortedPlayers,
    };
