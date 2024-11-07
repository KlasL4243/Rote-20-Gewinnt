import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rote20_gewinnt/data/manager/manager.dart';
import 'package:rote20_gewinnt/presentation/home/nothing_here.dart';
import 'package:rote20_gewinnt/presentation/settings/settings.dart';

const textScaler = TextScaler.linear(2);

class Names extends StatefulWidget {
  const Names({super.key});

  static int playerCount = 12;

  @override
  State<Names> createState() => _NamesState();
}

class _NamesState extends State<Names> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void goToSettings() {
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
        title: const Text("Namen"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Manager.game.players = [
            for (int i = 0; i < Names.playerCount; i++) "-"
          ];
          final state = _formKey.currentState!;
          state.save();

          log(Manager.game.players.toString());
          if (!state.validate()) {
            log("NamesForm not valide!");
            return;
          }
          log("NamesForm saved!");
          Manager.game.players.removeWhere((element) => element == "-");
          log(Manager.game.players.toString());
          goToSettings();
        },
        child: const Icon(Icons.check),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          semanticChildCount: Names.playerCount,
          children: [
            for (int i = 0; i < Names.playerCount; i++) ...[
              TextFormField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "spieler$i",
                ),
                textInputAction: i == (Names.playerCount - 1)
                    ? TextInputAction.done
                    : TextInputAction.next,
                onSaved: (String? value) {
                  if (value!.isEmpty) return;
                  Manager.game.players[i] = value;
                  log("name$i saved!");
                },
                validator: (String? name) => (name!.isEmpty)
                    ? null
                    : (Manager.game.players.take(i).contains(name))
                        ? "Der Name ist bereits vergeben!"
                        : null,
              ),
              const SizedBox(height: 5),
            ],
          ],
        ),
      ),
    );
  }
}
