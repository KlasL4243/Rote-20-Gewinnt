// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:rote20_gewinnt/data/game/round.dart';
import 'package:rote20_gewinnt/data/game/round_data.dart';

abstract class GameBase {
  String name = "";
  int maxCards = 7;
  int onWin = 10;
  int onLoose = -5;
  int onRoundWin = 1;
  List<String> players = [];

  @protected
  late List<int> cardCounts;

  @protected
  List<Round> data = [];
  @protected
  int currentIndex = -1;

  @protected
  late List<String> sortedPlayers;

  void initGame();
  bool goNextRound();

  int getCardMax();
  List<String> getPlayerOrder();

  void setBet(String player, int bet);
  void setWin(String player, int wins);

  bool validateWinCount();
  RoundData getScores();
}
