import 'package:flutter/material.dart';
import 'package:rote20_gewinnt/presentation/home/home_card.dart';
import 'package:rote20_gewinnt/presentation/home/nothing_here.dart';
import 'package:rote20_gewinnt/presentation/names/names.dart';

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
                widget: () => const NothingHere(),
              ),
              HomeCard(
                text: "Spielverlauf",
                widget: () => const NothingHere(),
              ),
              HomeCard(
                text: "Anleitung",
                widget: () => const NothingHere(),
              ),
              HomeCard(
                text: "Einstellungen",
                widget: () => const NothingHere(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
