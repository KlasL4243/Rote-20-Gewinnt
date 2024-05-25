import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:game_repository/game_repository.dart';

part 'game_overview_event.dart';
part 'game_overview_state.dart';

class GameOverviewBloc extends Bloc<GameEvent, GameSaveState> {
  GameOverviewBloc({
    required GameRepository gameRepository,
  })  : _gameRepository = gameRepository,
        super(
          const GameSaveState(
            status: GameStatus.initial,
          ),
        ) {
    on<GameDataChanged>(_onGameDataChanged);
  }

  final GameRepository _gameRepository;

  Future<void> _onGameDataChanged(
    GameDataChanged event,
    Emitter<GameSaveState> emit,
  ) async {
    emit(state.copyWith(status: GameStatus.saving));
    try {
      await _gameRepository.saveGame(event.game);
      emit(state.copyWith(status: GameStatus.success));
    } catch (e) {
      emit(state.copyWith(status: GameStatus.failure));
    }
  }
}
