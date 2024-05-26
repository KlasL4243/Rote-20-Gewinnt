import 'package:equatable/equatable.dart';
import 'package:game_api/game_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'round.g.dart';

@JsonSerializable(explicitToJson: true)
class Round extends Equatable {
  Round({
    required this.card_number,
    List<String>? players,
    List<PlayerRoundData>? data,
  }) : assert(players != null || data != null, "[players] or [data] is required!"),
      data = data ?? generatePlayerRoundData(players!);
      

  final int card_number;
  final List<PlayerRoundData> data;


  static List<PlayerRoundData> generatePlayerRoundData(List<String> players) => [
    for (String player in players) PlayerRoundData(player: player)
  ];

  static Round fromJson(JsonMap json) => _$RoundFromJson(json);

  JsonMap toJson() => _$RoundToJson(this);



  @override
  List<Object?> get props => [card_number, data];
}
