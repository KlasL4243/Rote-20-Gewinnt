// ignore_for_file: avoid_print

import 'package:rote20_gewinnt/data/game/round.dart';

abstract class GameBase {
  GameBase({
    required this.maxCards,
    required this.onWin,
    required this.onLoose,
    required this.onRoundWin,
    required this.players,
  });

  int maxCards; // default: 7
  int onWin; // default: 10
  int onLoose; // default: -5
  int onRoundWin; // default: 1
  List<String> players;

  List<Round> data = [];
  int currentRound = -1;
  late List<String> sortedPlayers;
  late List<int> cardCounts;

  bool goNextRound();

  int getCurrentCardMax();
  List<String> getSortedPlayers();

  void setBets(RoundData bets);
  void setWins(RoundData wins);

  RoundData getCurrentScores();
}
