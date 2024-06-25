import 'package:equatable/equatable.dart';
import 'package:game_api/game_api.dart';
import 'package:uuid/uuid.dart';

class Game extends Equatable {
  Game({
    required this.players,
  }) : id = const Uuid().v4();

  final String id;
  final List<Player> players;

  @override
  // TODO: implement props
  List<Object?> get props => [id, players];
}
