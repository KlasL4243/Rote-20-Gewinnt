import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rote20_gewinnt/data/game/game.dart';
import 'package:rote20_gewinnt/data/manager/manager.dart';
import 'package:rote20_gewinnt/main.dart';
import 'package:rote20_gewinnt/presentation/home/goto.dart';
import 'package:rote20_gewinnt/presentation/settings/weiter_fab.dart';

const TextScaler scaler = TextScaler.linear(1.5);

class Scores extends StatelessWidget {
  const Scores({super.key});

  @override
  Widget build(BuildContext context) {
    final scores = Manager.game.getScores().entries;
    log(scores.toString());

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
              for (DataEntry entry in scores) ...[
                scoreRow(entry),
                const Divider(),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

Widget scoreRow(DataEntry entry) {
  return Flexible(
    child: Center(
      child: Row(
        children: [
          Flexible(
            child: Center(
              child: Text(
                entry.key,
                textScaler: scaler,
              ),
            ),
          ),
          Flexible(
            child: Center(
              child: Text(
                entry.value.toString(),
                textScaler: scaler,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
