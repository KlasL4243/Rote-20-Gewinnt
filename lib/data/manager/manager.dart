import 'package:hive_flutter/hive_flutter.dart';
import 'package:rote20_gewinnt/data/game/game.dart';

class Manager {
  Manager._();

  static late Box<Game> _box;
  static late Game game;

  static Future<void> init() async {
    _box = await Hive.openBox('box');
  }

  static List<String> getSavedGameNames() => List.from(_box.keys);

  static void newGame() => game = Game();
  static Game loadGame(String name) => (game = _box.get(name)!);
  static Future<void> saveGame() async => await _box.put(game.name, game);
}
