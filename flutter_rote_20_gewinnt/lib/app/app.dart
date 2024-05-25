import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rote_20_gewinnt/theme/theme.dart';
import 'package:game_repository/game_repository.dart';

class App extends StatelessWidget {
  const App({required this.gameRepository, super.key});

  final GameRepository gameRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: gameRepository,
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: FlutterGameTheme.light,
      darkTheme: FlutterGameTheme.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomePage(),
    );
  }
}
