import 'package:equatable/equatable.dart';
import 'package:game_api/game_api.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'game.g.dart';

@JsonSerializable(explicitToJson: true)
class Game extends Equatable {
  Game({
    required this.name,
    required this.players,
    final String? id,
  }) : id = id ?? const Uuid().v4();

  final String name;
  final List<Player> players;
  final String id;
  List<Round> rounds = [];
  bool isCompleted = false;

  @override
  // TODO: implement props
  List<Object?> get props => [name, players, id, rounds, isCompleted];
}
