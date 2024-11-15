// ignore_for_file: avoid_print

import 'package:json_annotation/json_annotation.dart';
import 'package:rote20_gewinnt/data/game/game_base.dart';
import 'package:rote20_gewinnt/data/game/round.dart';
import 'package:rote20_gewinnt/data/json_map.dart';
import 'package:rote20_gewinnt/data/game/player_position.dart';

part 'game.g.dart';

@JsonSerializable(explicitToJson: true)
class Game extends GameBase {
  Game({
    required super.name,
    required super.maxCards,
    required super.onWin,
    required super.onLoose,
    required super.onRoundWin,
    required super.players,
  }) {
    setCardCounts();
  }

  Game.empty() : super.empty();

  factory Game.fromJson(JsonMap json) => _$GameFromJson(json);
  JsonMap toJson() => _$GameToJson(this);

  void setCardCounts() {
    cardCounts = [
      for (int i = 1; i < maxCards; i++) i,
      for (int i = maxCards; i >= 1; i--) i,
    ];
  }

  @override
  int getCurrentCardMax() => cardCounts[currentIndex];

  @override
  bool goNextRound() {
    if (currentIndex == cardCounts.length) return false;
    currentIndex++;
    currentBets = RoundData();
    currentWins = RoundData();
    sortedScores = [];

    return true;
  }

  @override
  List<String> getSortedPlayers() {
    final shiftIndex = (currentIndex) % players.length;

    sortedPlayers = [
      ...players.skip(shiftIndex),
      ...players.take(shiftIndex),
    ];

    return sortedPlayers;
  }

  @override
  void setBet(String player, int bet) {
    currentBets[player] = bet;
  }

  @override
  void setWin(String player, int wins) {
    currentWins[player] = wins;
  }

  @override
  void calculateScores() {
    int calculateScore(player) {
      final bet = currentBets[player]!;
      final wins = currentWins[player]!;
      final lastScore = lastScores?[player] ?? 0;
      return lastScore + wins + (bet == wins ? onWin : onLoose);
    }

    lastScores = RoundData.fromIterable(sortedPlayers, value: calculateScore);
    data.add(Round(bets: currentBets, wins: currentWins, scores: lastScores!));
  }

  @override
  List<PlayerPosition> getSortedScores() {
    if (sortedScores.isNotEmpty) return sortedScores;

    final scoreEntrieList = lastScores!.entries.toList();
    scoreEntrieList.sort((a, b) => b.value.compareTo(a.value));

    int position = 1;
    int score = scoreEntrieList.first.value;

    for (MapEntry mapEntry in scoreEntrieList) {
      if (mapEntry.value != score) position++;

      sortedScores.add(PlayerPosition(
        player: mapEntry.key,
        score: mapEntry.value,
        position: position,
      ));
    }

    return sortedScores;
  }
}
