import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:game_api/game_api.dart';
import 'package:local_storage_game_api/local_storage_game_api.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageGameApi extends GameApi {
  LocalStorageGameApi({
    required SharedPreferences plugin,
  }) : _plugin = plugin {
    _init();
  }

  final SharedPreferences _plugin;

  late final _gameStreamController = BehaviorSubject<List<Game>>.seeded(
    const [],
  );

  @visibleForTesting
  static const kGameCollectionKey = '__game_collection_key__';

  String? _getValue(String key) => _plugin.getString(key);

  Future<void> _setValue(String key, String value) => _plugin.setString(key, value);
  
  List<Game> gamesFromJson(String jsonString) => List<JsonMap>.from(
      jsonDecode(jsonString) as List)
        .map((jsonMap) => Game.fromJson( JsonMap.from(jsonMap) ))
        .toList();

  void _init() {
    final String? gamesJson = _getValue(kGameCollectionKey);
    _gameStreamController.add([ if(gamesJson != null) ...gamesFromJson(gamesJson) ]);

  }

  @override
  Stream<List<Game>> getGameList() => _gameStreamController.asBroadcastStream();

  @override
  Future<void> saveGame(Game game) {
    final gameList = [..._gameStreamController.value];

    final gameIndex = gameList.indexWhere((Game g) => game.id == g.id);
    gameIndex != -1 ? gameList.add(game) : gameList[gameIndex] = game;

    _gameStreamController.add(gameList);
    return _setValue(kGameCollectionKey, jsonEncode(gameList));
  }

  @override
  Future<void> close() => _gameStreamController.close();
}