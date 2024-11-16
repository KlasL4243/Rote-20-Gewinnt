import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rote20_gewinnt/data/manager/manager.dart';
import 'package:rote20_gewinnt/main.dart';
import 'package:rote20_gewinnt/presentation/bets/validators.dart';
import 'package:rote20_gewinnt/presentation/home/goto.dart';
import 'package:rote20_gewinnt/presentation/settings/entry_row.dart';
import 'package:rote20_gewinnt/presentation/settings/number_form_field.dart';
import 'package:rote20_gewinnt/presentation/settings/weiter_fab.dart';

class Wins extends StatefulWidget {
  const Wins({super.key});

  @override
  State<Wins> createState() => _WinsState();
}

class _WinsState extends State<Wins> {
  final maxCards = Manager.game.getCardMax();
  final orderedPlayers = Manager.game.getPlayerOrder();
  final _formKey = GlobalKey<FormState>();

  void validateAndSaveForm() {
    final FormState state = _formKey.currentState!;
    state.save();

    if (!state.validate()) return;
    if (!Manager.game.validateWinCount()) return;

    goto(context, Routes.scores);
  }

  @override
  Widget build(BuildContext context) {
    List<TextInputFormatter> getFormatters() => [
          LengthLimitingTextInputFormatter(maxCards > 9 ? 2 : 1),
          FilteringTextInputFormatter.allow(RegExp('[0-$maxCards]'))
        ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Wins - $maxCards Karten"),
      ),
      floatingActionButton: WeiterFab(
        onPressed: validateAndSaveForm,
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
                    onSaved: (wins) =>
                        Manager.game.setWin(player, int.parse(wins!)),
                    validator: (String? wins) =>
                        betValidator(wins, player, maxCards),
                    inputFormatters: getFormatters(),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
