import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rote20_gewinnt/data/manager/manager.dart';
import 'package:rote20_gewinnt/presentation/settings/settings.dart';

const textScaler = TextScaler.linear(2);

class Names extends StatefulWidget {
  const Names({super.key});

  static int itemcount = 12;

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
            return Settings();
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
          final state = _formKey.currentState!;
          if (!state.validate()) {
            log("NamesForm not valide!");
            return;
          }
          Manager.game.players = [];
          state.save();
          log("NamesForm saved!");
          log(Manager.game.players.toString());
        },
        child: const Icon(Icons.check),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(10),
          semanticChildCount: Names.itemcount,
          children: [
            for (int i = 0; i < Names.itemcount; i++)
              TextFormField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "spieler$i",
                ),
                textInputAction: i == (Names.itemcount - 1)
                    ? TextInputAction.done
                    : TextInputAction.next,
                initialValue: "",
                onSaved: (String? value) {
                  if (value!.isEmpty) return;
                  Manager.game.players.add(value);
                  log("name$i saved!");
                },
                validator: (String? name) => (name!.isEmpty)
                    ? null
                    : (Manager.game.players.contains(name))
                        ? "Der Name ist bereits vergeben!"
                        : null,
              ),
          ],
        ),
      ),
    );
  }
}
