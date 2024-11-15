import 'package:json_annotation/json_annotation.dart';
import 'package:rote20_gewinnt/data/json_map.dart';

part 'player_position.g.dart';

@JsonSerializable()
class PlayerPosition {
  PlayerPosition({
    required this.player,
    required this.score,
    required this.position,
  });

  final String player;
  final int score;
  final int position;

  factory PlayerPosition.fromJson(JsonMap json) =>
      _$PlayerPositionFromJson(json);
  JsonMap toJson() => _$PlayerPositionToJson(this);
}
