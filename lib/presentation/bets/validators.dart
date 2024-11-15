String? betValidator(String? bet, String player, int maxCards) {
  if (bet!.isEmpty) return "gib einen Wert an";
  final zahl = int.parse(bet);
  if (zahl < 0) return "Wert zu klein";
  if (zahl > maxCards) return "Wert zu groß";
  return null;
}
