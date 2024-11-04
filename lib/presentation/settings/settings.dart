// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rote20_gewinnt/data/game/game.dart';
import 'package:rote20_gewinnt/data/manager/manager.dart';
import 'package:rote20_gewinnt/presentation/home/home_card.dart';
import 'package:rote20_gewinnt/presentation/names/names.dart';
import 'package:rote20_gewinnt/presentation/names/number_form_field.dart';
import 'package:rote20_gewinnt/presentation/settings/entry_row.dart';

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
                    EntryRow(
                      text: "SpielName",
                      formField: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onSaved: (String? value) {
                          Manager.game.name = value!;
                          log("name saved!");
                        },
                        validator: (String? name) =>
                            (name == null || name.isEmpty)
                                ? "Bitte gib einen Namen ein"
                                : (Manager.getSavedGameNames().contains(name))
                                    ? "Der Name ist bereits vergeben!"
                                    : null,
                      ),
                    ),
                    Divider(),
                    EntryRow(
                      text: "maxCards",
                      formField: NumberFormField(
                        labelText: "maxCards",
                        initialValue: "7",
                        onSaved: (String? value) {
                          Manager.game.maxCards = int.parse(value!);
                          log("name saved!");
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty)
                            return "Keine valide Zahl";
                          if (int.parse(value) < 0) return "Zahl zu klein";
                          return null;
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(2),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
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
                    EntryRow(
                      text: "onWin",
                      formField: NumberFormField(
                        labelText: "onWin",
                        initialValue: "10",
                        onSaved: (String? value) {
                          Manager.game.onWin = int.parse(value!);
                          log("onWin saved!");
                        },
                      ),
                    ),
                    Divider(),
                    EntryRow(
                      text: "onLoose",
                      formField: NumberFormField(
                        labelText: "onLoose",
                        initialValue: "-5",
                        onSaved: (String? value) {
                          Manager.game.onLoose = int.parse(value!);
                          log("onLoose saved!");
                        },
                      ),
                    ),
                    Divider(),
                    EntryRow(
                      text: "onRoundWin",
                      formField: NumberFormField(
                        labelText: "onRoundWin",
                        initialValue: "1",
                        onSaved: (String? value) {
                          Manager.game.onRoundWin = int.parse(value!);
                          log("onRoundWin saved!");
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        // child: ListView(
        //   children: [
        //     TextFormField(
        //       decoration: const InputDecoration(
        //         border: OutlineInputBorder(),
        //         labelText: "Spielname",
        //       ),
        //       initialValue: "spiel_01",
        //       onSaved: (String? value) {
        //         Manager.game.name = value!;
        //         log("name saved!");
        //       },
        //       validator: (String? name) => (name == null || name.isEmpty)
        //           ? "Bitte gib einen Namen ein"
        //           : (Manager.getSavedGameNames().contains(name))
        //               ? "Der Name ist bereits vergeben!"
        //               : null,
        //     ),
        //     NumberFormField(
        //       labelText: "maxCards",
        //       initialValue: "7",
        //       onSaved: (String? value) {
        //         Manager.game.maxCards = int.parse(value!);
        //         log("name saved!");
        //       },
        //       validator: (String? value) {
        //         if (value == null || value.isEmpty) return "Keine valide Zahl";
        //         if (int.parse(value) < 0) return "Zahl zu klein";
        //         return null;
        //       },
        //     ),
        //     NumberFormField(
        //       labelText: "onWin",
        //       initialValue: "10",
        //       onSaved: (String? value) {
        //         Manager.game.onWin = int.parse(value!);
        //         log("onWin saved!");
        //       },
        //     ),
        //     NumberFormField(
        //       labelText: "onLoose",
        //       initialValue: "-5",
        //       onSaved: (String? value) {
        //         Manager.game.onLoose = int.parse(value!);
        //         log("onLoose saved!");
        //       },
        //     ),
        //     NumberFormField(
        //       labelText: "onRoundWin",
        //       initialValue: "1",
        //       onSaved: (String? value) {
        //         Manager.game.onRoundWin = int.parse(value!);
        //         log("onRoundWin saved!");
        //       },
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
