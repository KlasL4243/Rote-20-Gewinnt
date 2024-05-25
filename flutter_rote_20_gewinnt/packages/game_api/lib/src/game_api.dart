import 'package:game_api/game_api.dart';

abstract class GameApi {
  const GameApi();

  Stream<Game> getGame();

  Future<void> saveGame(Game game);

  Future<void> close();

  //TODO: implement_more?

}

//TODO: implement_Exeptions?