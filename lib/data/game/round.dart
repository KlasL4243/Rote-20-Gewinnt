import 'package:json_annotation/json_annotation.dart';
import 'package:rote20_gewinnt/data/game/round_data.dart';
import 'package:rote20_gewinnt/data/json_map.dart';

part 'round.g.dart';

@JsonSerializable(explicitToJson: true)
@RoundDataConvertor()
class Round {
  Round();

  RoundData bets = RoundData();
  RoundData wins = RoundData();
  RoundData scores = RoundData();

  factory Round.fromJson(JsonMap json) => _$RoundFromJson(json);
  Map toJson() => _$RoundToJson(this);
}
