import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rote20_gewinnt/data/manager/manager.dart';
import 'package:rote20_gewinnt/main.dart';
import 'package:rote20_gewinnt/presentation/home/goto.dart';
import 'package:rote20_gewinnt/data/game/player_position.dart';
import 'package:rote20_gewinnt/presentation/settings/weiter_fab.dart';

const TextScaler scaler = TextScaler.linear(1.5);

String formatScore(PlayerPosition pp) {
  return "${pp.position}. ${pp.player}: ${pp.score}";
}

class Scores extends StatelessWidget {
  const Scores({super.key});

  @override
  Widget build(BuildContext context) {
    final scoreEntires = Manager.game.getSortedScores();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Scores"),
      ),
      floatingActionButton: WeiterFab(
        onPressed: () {
          Manager.game.goNextRound();
          goto(context, Routes.bets);
        },
      ),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.75,
          heightFactor: 0.75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (PlayerPosition pp in scoreEntires)
                Flexible(
                  child: Card(
                    elevation: 8,
                    color: Colors.lightBlue,
                    child: Center(
                      child: Row(
                        children: [
                          Flexible(
                            child: Center(
                              child:
                                  Text("${pp.position}.", textScaler: scaler),
                            ),
                          ),
                          Flexible(
                            child: Center(
                              child: Text(pp.player, textScaler: scaler),
                            ),
                          ),
                          Flexible(
                            child: Center(
                              child:
                                  Text(pp.score.toString(), textScaler: scaler),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
