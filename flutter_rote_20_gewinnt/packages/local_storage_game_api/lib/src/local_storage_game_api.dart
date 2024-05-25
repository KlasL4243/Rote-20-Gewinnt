import 'dart:async';
import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:game_api/game_api.dart';

class LocalStorageGameApi extends GameApi {
  LocalStorageGameApi({
    required SharedPreferences plugin,
  }) : _plugin = plugin {
    _init();
  }

  final SharedPreferences _plugin;

  late final _gameSteamController = BehaviorSubject<Game>.seeded(
    Game(),
  );

  @visibleForTesting
  static const kGameCollectionKey = '__game_collection_key__';

  String? _getValue(String key) => _plugin.getString(key);
  Future<void> _setValue(String key, String value) =>
      _plugin.setString(key, value);

  void _init() {
    final String? gameJson = _getValue(kGameCollectionKey);
    assert(gameJson != null, "SharedPreferences returned null");
    final Game game = Game.fromJson(JsonMap.from(json.decode(gameJson!)));

    _gameSteamController.add(game);
  }

  @override
  Stream<Game> getGame() => _gameSteamController.asBroadcastStream();

  @override
  Future<void> saveGame(Game game) {
    final Game game = _gameSteamController.value;
    _gameSteamController.add(game);
    return _setValue(kGameCollectionKey, json.encode(game));
  }

  @override
  Future<void> close() {
    return _gameSteamController.close();
  }
}
