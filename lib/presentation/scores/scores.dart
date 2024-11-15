import 'package:flutter/material.dart';
import 'package:rote20_gewinnt/data/manager/manager.dart';
import 'package:rote20_gewinnt/main.dart';
import 'package:rote20_gewinnt/presentation/home/goto.dart';
import 'package:rote20_gewinnt/presentation/settings/weiter_fab.dart';

class Scores extends StatelessWidget {
  const Scores({super.key});

  @override
  Widget build(BuildContext context) {
    final scoreEntires = Manager.game.getSortedScores();

    final List<String> texts = [];

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
      body: Column(
        children: [
          for (String text in texts){}

        ],
      ),
    );
  }
}
