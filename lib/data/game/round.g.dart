// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'round.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Round _$RoundFromJson(Map<String, dynamic> json) => Round()
  ..bets =
      const RoundDataConvertor().fromJson(json['bets'] as Map<String, dynamic>)
  ..wins =
      const RoundDataConvertor().fromJson(json['wins'] as Map<String, dynamic>)
  ..scores = const RoundDataConvertor()
      .fromJson(json['scores'] as Map<String, dynamic>);

Map<String, dynamic> _$RoundToJson(Round instance) => <String, dynamic>{
      'bets': const RoundDataConvertor().toJson(instance.bets),
      'wins': const RoundDataConvertor().toJson(instance.wins),
      'scores': const RoundDataConvertor().toJson(instance.scores),
    };
