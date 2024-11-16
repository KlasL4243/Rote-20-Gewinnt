import 'package:flutter/material.dart';
import 'package:rote20_gewinnt/data/manager/manager.dart';
import 'package:wheel_picker/wheel_picker.dart';

const TextScaler textScaler = TextScaler.linear(1.5);

class BetRow extends StatefulWidget {
  const BetRow(this.player, {super.key});

  final String player;

  @override
  State<BetRow> createState() => _BetRowState();
}

class _BetRowState extends State<BetRow> {
  final int playercount = Manager.game.sortedPlayers.length;
  late final WheelPickerController _controller = WheelPickerController(
    itemCount: Manager.game.getCardMax(),
  );

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        children: [
          Flexible(
            child: Center(
              child: Text(
                widget.player,
                textScaler: textScaler,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width / 2,
            height: MediaQuery.sizeOf(context).height / 5,
            child: Flexible(
              child: WheelPicker(
                looping: false,
                controller: _controller,
                scrollDirection: Axis.horizontal,
                builder: (context, index) => Text(index.toString()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
