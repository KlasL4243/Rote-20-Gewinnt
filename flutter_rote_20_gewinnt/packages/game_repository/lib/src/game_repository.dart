import 'package:game_api/game_api.dart';

class GameRepository {
  const GameRepository({
    required GameApi gameApi,
  }) : _gameApi = gameApi;

  final GameApi _gameApi;

  Stream<Game> getGame() => _gameApi.getGame();

  Future<void> saveGame(Game game) => _gameApi.saveGame(game);
}