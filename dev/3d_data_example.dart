// ignore_for_file: unreachable_from_main
// ignore_for_file: depend_on_referenced_packages

import 'package:collection/collection.dart';

extension PlayerNames on List<String> {
  List<Player> toPlayers() => mapIndexed(Player.new).toList();
}

class Player {
  const Player(this.index, this.name);

  final String name;
  final int index;

  @override
  String toString() => 'Player(name: $name, index: $index)';
}

class Game {
  Game({
    required final List<String> playerNames,
  }) : players = playerNames.toPlayers();

  List<Player> players;
}
