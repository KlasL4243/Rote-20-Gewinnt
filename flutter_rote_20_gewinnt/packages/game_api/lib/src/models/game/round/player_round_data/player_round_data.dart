import 'package:equatable/equatable.dart';
import 'package:game_api/game_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'player_round_data.g.dart';

@JsonSerializable()
class PlayerRoundData extends Equatable {
  PlayerRoundData({
    required this.player,
    this.bet,
    this.wins,
    this.score
  });

  final String player;
  final int? bet;
  final int? wins;
  final int? score;

  static PlayerRoundData fromJson(JsonMap json) => _$PlayerRoundDataFromJson(json);

  JsonMap toJson() => _$PlayerRoundDataToJson(this);


  @override
  List<Object?> get props => [player, bet, wins, score];

}