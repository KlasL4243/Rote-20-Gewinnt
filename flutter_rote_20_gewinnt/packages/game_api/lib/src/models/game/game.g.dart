// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) => Game(
      name: json['name'] as String,
      players:
          (json['players'] as List<dynamic>).map((e) => e as String).toList(),
      id: json['id'] as String?,
      start_time: json['start_time'] == null
          ? null
          : DateTime.parse(json['start_time'] as String),
      completed: json['completed'] as bool?,
      rules: json['rules'] == null
          ? null
          : Rules.fromJson(json['rules'] as Map<String, dynamic>),
      rounds: (json['rounds'] as List<dynamic>?)
          ?.map((e) => Round.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'name': instance.name,
      'players': instance.players,
      'id': instance.id,
      'start_time': instance.start_time.toIso8601String(),
      'completed': instance.completed,
      'rules': instance.rules.toJson(),
      'rounds': instance.rounds.map((e) => e.toJson()).toList(),
    };
