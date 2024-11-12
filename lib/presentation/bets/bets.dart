import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rote20_gewinnt/data/manager/manager.dart';
import 'package:rote20_gewinnt/presentation/bets/bet_row.dart';
import 'package:rote20_gewinnt/presentation/home/nothing_here.dart';
import 'package:rote20_gewinnt/presentation/settings/entry_row.dart';
import 'package:rote20_gewinnt/presentation/settings/number_form_field.dart';

class Bets extends StatefulWidget {
  const Bets({super.key});

  @override
  State<Bets> createState() => _BetsState();
}

class _BetsState extends State<Bets> {
  final int maxCards = Manager.game.getCurrentCardMax();
  final orderedPlayers = Manager.game.getSortedPlayers();
  final int playercount = Manager.game.sortedPlayers.length;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void gotToWins() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return const NothingHere();
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Bets - $maxCards Karten"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.lightBlue,
        label: const Text("Weiter"),
        onPressed: gotToWins,
        icon: const Icon(Icons.arrow_forward),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              for (String player in orderedPlayers)
                EntryRow(
                  text: player,
                  formField: NumberFormField(
                    onSaved: (bet) =>
                        Manager.game.currentBets[player] = int.parse(bet!),
                    validator: (String? bet) {
                      if (bet!.isEmpty) return "gib einen Wert an";
                      final zahl = int.parse(bet);
                      if (zahl < 0) return "Wert zu klein";
                      if (zahl > maxCards) return "Wert zu groß";
                      return null;
                    },
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(maxCards > 9 ? 2 : 1),
                      FilteringTextInputFormatter.allow(RegExp('[0-$maxCards]'))
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
