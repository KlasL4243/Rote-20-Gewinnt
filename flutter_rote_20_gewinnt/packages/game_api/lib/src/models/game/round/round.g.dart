// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'round.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Round _$RoundFromJson(Map<String, dynamic> json) => Round(
      card_number: (json['card_number'] as num).toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PlayerRoundData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoundToJson(Round instance) => <String, dynamic>{
      'card_number': instance.card_number,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
