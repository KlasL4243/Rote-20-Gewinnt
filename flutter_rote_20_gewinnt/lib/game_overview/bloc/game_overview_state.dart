part of 'game_overview_bloc.dart';

enum GameStatus { initial, saving, success, failure }

final class GameSaveState extends Equatable {
  const GameSaveState({
    this.status = GameStatus.initial,
  });

  final GameStatus status;

  GameSaveState copyWith({
    GameStatus? status,
  }) {
    return GameSaveState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [];
}