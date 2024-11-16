// ignore_for_file: avoid_print

import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rote20_gewinnt/data/game/game_base.dart';
import 'package:rote20_gewinnt/data/game/round.dart';
import 'package:rote20_gewinnt/data/game/round_data.dart';
import 'package:rote20_gewinnt/data/json_map.dart';

part 'game.g.dart';

typedef DataEntry = MapEntry<String, int>;

@JsonSerializable(explicitToJson: true)
class Game extends GameBase {
  Game();

  factory Game.fromJson(JsonMap json) => _$GameFromJson(json);
  JsonMap toJson() => _$GameToJson(this);

  @override
  void initGame() {
    cardCounts = [
      for (int i = 1; i < maxCards; i++) i,
      for (int i = maxCards; i >= 1; i--) i,
    ];
    goNextRound();
  }

  @override
  bool goNextRound() {
    if (currentIndex == cardCounts.length) return false;

    currentIndex++;

    data.add(Round());

    final shiftIndex = (currentIndex) % players.length;
    sortedPlayers = [
      ...players.skip(shiftIndex),
      ...players.take(shiftIndex),
    ];

    return true;
  }

  @override
  int getCardMax() => cardCounts[currentIndex];

  @override
  List<String> getPlayerOrder() => sortedPlayers;

  @override
  void setBet(String player, int bet) {
    data[currentIndex].bets[player] = bet;
  }

  @override
  void setWin(String player, int wins) {
    data[currentIndex].wins[player] = wins;
  }

  @override
  bool validateWinCount() {
    return data[currentIndex].wins.values.sum == getCardMax();
  }

  @override
  RoundData getScores() {
    final currentRound = data[currentIndex];

    RoundData scores = currentRound.scores;
    if (scores.isNotEmpty) return scores;

    final lastScores = currentIndex == 0 ? null : data[currentIndex - 1].scores;

    DataEntry calcScore(String player) {
      final wins = currentRound.bets[player]!;
      final bet = currentRound.wins[player]!;
      final lastScore = lastScores?[player]! ?? 0;
      final score = lastScore + wins + (bet == wins ? onWin : onLoose);
      return MapEntry(player, score);
    }

    final List<DataEntry> entrieList = List.from(players.map(calcScore));
    entrieList.sort((a, b) => b.value.compareTo(a.value));
    scores = RoundData.fromEntries(entrieList);

    return scores;
  }
}
