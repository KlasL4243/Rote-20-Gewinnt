// ignore_for_file: avoid_print

import 'dart:io';

import 'package:rote20_gewinnt/data/game/game_base.dart';
import 'package:rote20_gewinnt/data/game/round.dart';

class Game extends GameBase {
  Game({
    required super.maxCards,
    required super.onWin,
    required super.onLoose,
    required super.onRoundWin,
    required super.players,
  }) {
    setCardCounts();
  }

  void setCardCounts() {
    cardCounts = [
      for (int i = 1; i < maxCards; i++) i,
      for (int i = maxCards; i >= 1; i--) i,
    ];
  }

  @override
  int getCurrentCardMax() => cardCounts[currentRound];

  @override
  RoundData getCurrentScores() => data[currentRound].scores;

  @override
  bool goNextRound() {
    if (currentRound == cardCounts.length) return false;
    currentRound++;
    return true;
  }

  @override
  List<String> getSortedPlayers() {
    final shiftIndex = (currentRound) % players.length;

    sortedPlayers = [
      ...players.skip(shiftIndex),
      ...players.take(shiftIndex),
    ];

    return sortedPlayers;
  }

  @override
  void setBets(RoundData bets) {
    final round = Round();
    round.bets = bets;
    data.add(round);
  }

  @override
  void setWins(RoundData wins) {
    final oldScores = data.lastOrNull?.scores;
    final round = data[currentRound];

    round.wins = wins;
    round.scores = RoundData.fromIterable(sortedPlayers, value: (player) {
      final bet = round.bets[player]!;
      final wins = round.wins[player]!;
      final oldScore = oldScores?[player] ?? 0;

      return oldScore + wins + (bet == wins ? onWin : onLoose);
    });
  }
}

void main() {
  final players = ["lukas", "mirjam", "maik"];
  final game = Game(
    maxCards: 10,
    players: players,
    onWin: 10,
    onLoose: -5,
    onRoundWin: 1,
  );

  while (game.goNextRound()) {
    final playerOrder = game.getSortedPlayers();
    final max = game.getCurrentCardMax();

    final bets = RoundData.fromIterable(playerOrder, value: (player) {
      stdout.write("$player bet [0-$max]: ");
      return int.parse(stdin.readLineSync()!);
    });

    game.setBets(bets);

    game.setWins(RoundData.fromIterable(playerOrder, value: (player) {
      stdout.write("$player bet=${bets[player]}, wins [0-$max]: ");
      return int.parse(stdin.readLineSync()!);
    }));

    print(game.getCurrentScores().toString());
  }
}
