import 'package:game_api/game_api.dart';

extension EmptyPlayerStats on List<Player> {
  Map<Player, Stats> toPlayerStats() =>
      Map<Player, Stats>.fromIterable(this, value: Stats.new);
}

class Round {
  Round({
    required this.id,
    required this.cardCount,
    required final List<Player> players,
  }) : playerStats = players.toPlayerStats();

  final int id;
  final int cardCount;
  Map<Player, Stats> playerStats;

  void setAllBets(final Map<Player, int> betMap) {
    betMap.forEach(_setBet);
  }

  void _setBet(final Player player, final int bet) {
    playerStats[player]?.bet = bet;
  }

  void setAllWins(final Map<Player, int> winsMap) {
    winsMap.forEach(_setWins);
  }

  void _setWins(final Player player, final int bet) {
    playerStats[player]?.bet = bet;
  }
}
