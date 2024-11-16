import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rote20_gewinnt/data/manager/manager.dart';
import 'package:rote20_gewinnt/main.dart';
import 'package:rote20_gewinnt/presentation/bets/validators.dart';
import 'package:rote20_gewinnt/presentation/home/goto.dart';
import 'package:rote20_gewinnt/presentation/settings/entry_row.dart';
import 'package:rote20_gewinnt/presentation/settings/number_form_field.dart';
import 'package:rote20_gewinnt/presentation/settings/weiter_fab.dart';

class Bets extends StatefulWidget {
  const Bets({super.key});

  @override
  State<Bets> createState() => _BetsState();
}

class _BetsState extends State<Bets> {
  final int maxCards = Manager.game.getCardMax();
  final orderedPlayers = Manager.game.getPlayerOrder();
  final int playercount = Manager.game.getPlayerOrder().length;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void validateAndSaveForm() {
      final FormState state = _formKey.currentState!;
      state.save();

      if (!state.validate()) return;

      goto(context, Routes.wins);
    }

    List<TextInputFormatter> getFormatters() => [
          LengthLimitingTextInputFormatter(maxCards > 9 ? 2 : 1),
          FilteringTextInputFormatter.allow(RegExp('[0-$maxCards]'))
        ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Bets - $maxCards Karten"),
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
                    onSaved: (bet) =>
                        Manager.game.setBet(player, int.parse(bet!)),
                    validator: (String? bet) =>
                        betValidator(bet, player, maxCards),
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
