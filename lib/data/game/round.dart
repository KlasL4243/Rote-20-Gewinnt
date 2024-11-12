import 'package:json_annotation/json_annotation.dart';
import 'package:rote20_gewinnt/data/json_map.dart';

part 'round.g.dart';

typedef RoundData = Map<String, int>;

@JsonSerializable()
class Round {
  Round({
    required this.bets,
    required this.wins,
    required this.scores,
  });

  Round.empty();

  late RoundData bets;
  late RoundData wins;
  late RoundData scores;

  factory Round.fromJson(JsonMap json) => _$RoundFromJson(json);
  Map toJson() => _$RoundToJson(this);
}
