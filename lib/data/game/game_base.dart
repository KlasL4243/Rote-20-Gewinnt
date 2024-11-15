// ignore_for_file: avoid_print

import 'package:rote20_gewinnt/data/game/round.dart';
import 'package:rote20_gewinnt/data/game/player_position.dart';

abstract class GameBase {
  GameBase({
    required this.name,
    required this.maxCards,
    required this.onWin,
    required this.onLoose,
    required this.onRoundWin,
    required this.players,
  });

  GameBase.empty();

  late String name;
  late int maxCards; // default: 7
  late int onWin; // default: 10
  late int onLoose; // default: -5
  late int onRoundWin; // default: 1
  List<String> players = [];

  List<Round> data = [];
  int currentIndex = -1;
  late List<String> sortedPlayers;
  late List<int> cardCounts;

  late RoundData currentBets;
  late RoundData currentWins;
  RoundData? lastScores;
  List<PlayerPosition> sortedScores = [];

  bool goNextRound();

  int getCurrentCardMax();
  List<String> getSortedPlayers();

  void setBet(String player, int bet);
  void setWin(String player, int wins);

  void calculateScores();
  List<PlayerPosition> getSortedScores();
}
