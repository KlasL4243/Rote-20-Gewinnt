part of 'game_overview_bloc.dart';

sealed class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object> get props => [];
}

final class GameDataChanged extends GameEvent {
  const GameDataChanged(this.game);

  final Game game;

  @override
  List<Object> get props => [game.game_uuid, game.rounds.length];
}
