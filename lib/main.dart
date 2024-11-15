import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rote20_gewinnt/data/game/game_adapter.dart';
import 'package:rote20_gewinnt/data/manager/manager.dart';
import 'package:rote20_gewinnt/presentation/bets/bets.dart';
import 'package:rote20_gewinnt/presentation/home/home.dart';
import 'package:rote20_gewinnt/presentation/names/names.dart';
import 'package:rote20_gewinnt/presentation/scores/scores.dart';
import 'package:rote20_gewinnt/presentation/settings/settings.dart';
import 'package:rote20_gewinnt/presentation/wins.dart/wins.dart';

enum Routes {
  settings,
  names,
  bets,
  wins,
  scores;

  String get route => "/$name";
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(GameAdapter());
  await Manager.init();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      routes: <String, WidgetBuilder>{
        Routes.settings.route: (BuildContext context) => const Settings(),
        Routes.names.route: (BuildContext context) => const Names(),
        Routes.bets.route: (BuildContext context) => const Bets(),
        Routes.wins.route: (BuildContext context) => const Wins(),
        Routes.scores.route: (BuildContext context) => const Scores(),
      },
    );
  }
}
