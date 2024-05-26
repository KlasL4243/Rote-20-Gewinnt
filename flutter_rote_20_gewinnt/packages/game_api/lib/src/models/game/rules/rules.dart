import 'package:equatable/equatable.dart';
import 'package:game_api/game_api.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'rules.g.dart';

@immutable
@JsonSerializable()
class Rules extends Equatable {
  const Rules({
    int? max_cards,
    int? points_round_win,
    int? points_bet_win,
    int? points_bet_lose,
  })  : max_cards = max_cards ?? 7,
        points_round_win = points_round_win ?? 1,
        points_bet_win = points_bet_win ?? 10,
        points_bet_lose = points_bet_lose ?? -5;

  final int max_cards;
  final int points_round_win;
  final int points_bet_win;
  final int points_bet_lose;

  static Rules fromJson(JsonMap json) => _$RulesFromJson(json);

  JsonMap toJson() => _$RulesToJson(this);

  @override
  List<Object?> get props =>
      [max_cards, points_round_win, points_bet_win, points_bet_lose];
}
