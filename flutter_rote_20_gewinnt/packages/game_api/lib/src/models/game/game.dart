import 'package:equatable/equatable.dart';
import 'package:game_api/game_api.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'game.g.dart';

@JsonSerializable(explicitToJson: true)
class Game extends Equatable {
  Game({
    required this.name,
    required this.players,
    String? id,
    DateTime? start_time,
    bool? completed,
    Rules? rules,
    List<Round>? rounds,
  })  : id = id ?? const Uuid().v4(),
        start_time = start_time ?? DateTime.now(),
        completed = completed ?? false,
        rules = rules ?? Rules(),
        cardsOnRound = getCardsOnRound(rules?.max_cards ?? Rules().max_cards),
        rounds = rounds ?? [];

  final String name;
  final List<String> players;
  final String id;
  final DateTime start_time;
  final bool completed;
  final Rules rules;
  final List<int> cardsOnRound;
  final List<Round> rounds;

  static List<int> getCardsOnRound(int max_cards) => [
    ...Iterable.generate(max_cards, (int x) => x),
    ...List.generate(max_cards - 1, (int x) => x).reversed
  ];

  void addRound(Round round) => rounds.add(round);

  static Game fromJson(JsonMap json) => _$GameFromJson(json);

  JsonMap toJson() => _$GameToJson(this);

  @override
  List<Object?> get props => [id, name, start_time, completed];
}
