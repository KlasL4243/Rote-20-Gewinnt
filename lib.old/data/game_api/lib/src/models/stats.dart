class Stats {
  Stats(
    final dynamic _,
  )   : bet = null,
        wins = null;

  int? bet;
  int? wins;

  @override
  String toString() => 'Stats(bet: $bet, wins: $wins)';
}
