import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:game_api/game_api.dart';

part 'game.g.dart';

final Map rules_defaults = {
  "points": { "round_win": 1, "bet_win": 10, "bet_lose": -5 },
  "max_cards": 7
};

@JsonSerializable()
class Game extends Equatable {
  Game({
    String? game_name,
    String? game_uuid,
    DateTime? start_time,
    bool? finished,
    Map? rules,
    Map? rounds,
  }) : game_name = game_name ?? "game1",
       game_uuid = game_uuid ?? const Uuid().v4(),
       start_time = start_time ?? DateTime.now(),
       finished = finished ?? false,
       rules = rules ?? rules_defaults,
       rounds = rounds ?? {};

  final String game_name;
  final game_uuid;
  final DateTime start_time;
  final bool finished;
  final Map rules;
  final Map rounds;

  Game copyWith({
    String? game_name,
    String? game_uuid,
    DateTime? start_time,
    bool? finished,
    Map? rules,
    Map? rounds,
  }) {
    return Game(
      game_name: game_name ?? this.game_name,
       game_uuid: game_uuid ?? this.game_uuid,
       start_time: start_time ?? this.start_time,
       finished: finished ?? this.finished,
       rules: rules ?? this.rules,
       rounds: rounds ?? this.rounds
    );
  }

  static Game fromJson(JsonMap json) => _$GameFromJson(json);

  JsonMap toJson() => _$GameToJson(this);

  @override
  List<Object?> get props => [game_name, rounds.length];
}
