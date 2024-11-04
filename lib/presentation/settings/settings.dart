import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rote20_gewinnt/data/game/game.dart';
import 'package:rote20_gewinnt/data/manager/manager.dart';
import 'package:rote20_gewinnt/presentation/names/names.dart';
import 'package:rote20_gewinnt/presentation/names/number_form_field.dart';

String? intValidator(String? value) {
  final zahl = int.tryParse(value!);
  if (zahl == null) return "keine valide Zahl!";
  return null;
}

class Settings extends StatefulWidget {
  Settings({super.key}) {
    init();
  }

  void init() => Manager.game = Game.empty();

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void goToNames() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return const Names();
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Einstellungen"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final state = _formKey.currentState!;
          if (!state.validate()) {
            log("SettingsForm not valide!");
            return;
          }

          state.save();
          log("SettingsForm saved!");
          goToNames();
        },
        child: const Icon(Icons.check),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Spielname",
              ),
              initialValue: "spiel_01",
              onSaved: (String? value) {
                Manager.game.name = value!;
                log("name saved!");
              },
              validator: (String? name) => (name == null || name.isEmpty)
                  ? "Bitte gib einen Namen ein"
                  : (Manager.getSavedGameNames().contains(name))
                      ? "Der Name ist bereits vergeben!"
                      : null,
            ),
            NumberFormField(
              labelText: "maxCards",
              initialValue: "7",
              onSaved: (String? value) {
                Manager.game.maxCards = int.parse(value!);
                log("name saved!");
              },
              validator: (int? value) => value! < 0 ? "Zahl zu klein" : null,
            ),
            NumberFormField(
              labelText: "onWin",
              initialValue: "10",
              onSaved: (String? value) {
                Manager.game.onWin = int.parse(value!);
                log("onWin saved!");
              },
              validator: (value) => null,
            ),
            NumberFormField(
              labelText: "onLoose",
              initialValue: "-5",
              onSaved: (String? value) {
                Manager.game.onLoose = int.parse(value!);
                log("onLoose saved!");
              },
              validator: (value) => null,
            ),
            NumberFormField(
              labelText: "onRoundWin",
              initialValue: "1",
              onSaved: (String? value) {
                Manager.game.onRoundWin = int.parse(value!);
                log("onRoundWin saved!");
              },
              validator: (value) => null,
            ),
          ],
        ),
      ),
    );
  }
}
