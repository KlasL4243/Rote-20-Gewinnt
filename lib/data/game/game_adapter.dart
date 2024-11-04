import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:rote20_gewinnt/data/game/game.dart';

class GameAdapter extends TypeAdapter<Game> {
  @override
  int get typeId => 0;

  @override
  Game read(BinaryReader reader) {
    return Game.fromJson(jsonDecode(reader.read()));
  }

  @override
  void write(BinaryWriter writer, Game obj) {
    writer.write(jsonEncode(obj.toJson()));
  }
}
