import 'package:game_api/game_api.dart';

abstract class GameApi {
  const GameApi();

  Stream<List<Game>> getGameList();

  Future<void> saveGame(Game game);

  Future<void> close();
}