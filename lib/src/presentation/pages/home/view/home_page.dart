import 'package:flutter/material.dart';
import 'package:rote20_gewinnt/src/presentation/pages/home/widgets/home_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(final BuildContext context) {
    return const FractionallySizedBox(
      heightFactor: 0.5,
      widthFactor: 0.75,
      child: Column(
        children: [
          HomeCard(text: 'Neues Spiel'),
          HomeCard(text: 'Vergangene Spiele'),
          HomeCard(text: 'Statistiken'),
          HomeCard(text: 'Einstellungen'),
        ],
      ),
    );
  }
}
