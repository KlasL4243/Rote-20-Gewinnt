// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rote20_gewinnt/data/game/game.dart';
import 'package:rote20_gewinnt/data/manager/manager.dart';
import 'package:rote20_gewinnt/presentation/names/names.dart';
import 'package:rote20_gewinnt/presentation/settings/number_form_field.dart';
import 'package:rote20_gewinnt/presentation/settings/entry_row.dart';

String? intValidator(String? value) {
  final zahl = int.tryParse(value!);
  if (zahl == null) return "keine valide Zahl!";
  return null;
}

String getUnusedGameName() {
  final names = Manager.getSavedGameNames();
  int i = 1;
  String name = "";
  while (true) {
    name = "spiel$i";
    if (!names.contains(name)) return name;
  }
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
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Weiter"),
        backgroundColor: Colors.lightBlue,
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
        icon: const Icon(Icons.arrow_forward),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.lightBlue,
                ),
                child: Column(
                  children: [
                    spielNameRow(),
                    Divider(),
                    maxCardsRow(),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.lightBlue[300],
                ),
                child: Column(
                  children: [
                    onWinRow(),
                    Divider(),
                    onLooseRow(),
                    Divider(),
                    onRoundWinRow()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

EntryRow spielNameRow() {
  return EntryRow(
    text: "SpielName",
    formField: TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      initialValue: getUnusedGameName(),
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
  );
}

EntryRow maxCardsRow() {
  return EntryRow(
    text: "maxCards",
    formField: NumberFormField(
      labelText: "maxCards",
      initialValue: "7",
      onSaved: (String? value) {
        Manager.game.maxCards = int.parse(value!);
        log("name saved!");
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) return "Keine valide Zahl";
        if (int.parse(value) < 0) return "Zahl zu klein";
        return null;
      },
      inputFormatters: [
        LengthLimitingTextInputFormatter(2),
        FilteringTextInputFormatter.digitsOnly,
      ],
    ),
  );
}

EntryRow onWinRow() {
  return EntryRow(
    text: "onWin",
    formField: NumberFormField(
      labelText: "onWin",
      initialValue: "10",
      onSaved: (String? value) {
        Manager.game.onWin = int.parse(value!);
        log("onWin saved!");
      },
    ),
  );
}

EntryRow onLooseRow() {
  return EntryRow(
    text: "onLoose",
    formField: NumberFormField(
      labelText: "onLoose",
      initialValue: "-5",
      onSaved: (String? value) {
        Manager.game.onLoose = int.parse(value!);
        log("onLoose saved!");
      },
    ),
  );
}

EntryRow onRoundWinRow() {
  return EntryRow(
    text: "onRoundWin",
    formField: NumberFormField(
      labelText: "onRoundWin",
      initialValue: "1",
      onSaved: (String? value) {
        Manager.game.onRoundWin = int.parse(value!);
        log("onRoundWin saved!");
      },
    ),
  );
}
