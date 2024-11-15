import 'package:flutter/material.dart';
import 'package:rote20_gewinnt/data/manager/manager.dart';
import 'package:rote20_gewinnt/main.dart';
import 'package:rote20_gewinnt/presentation/home/goto.dart';
import 'package:rote20_gewinnt/presentation/home/home_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.75,
          heightFactor: 0.5,
          child: Column(
            children: [
              HomeCard(
                  text: "Neues Spiel",
                  onTap: () {
                    Manager.newGame();
                    goto(context, Routes.settings);
                  }),
              const HomeCard(
                text: "Spielverlauf",
              ),
              const HomeCard(
                text: "Anleitung",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
