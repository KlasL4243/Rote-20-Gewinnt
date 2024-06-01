import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rote20_gewinnt/l10n/l10n.dart';
import 'package:rote20_gewinnt/theme/theme.dart';

class App extends StatelessWidget {
  const App({required this.gameRepository, super.key});

  final /*TODO: re-add: GameRepository*/ gameRepository;

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
      theme: FlutterAppTheme.light,
      darkTheme: FlutterAppTheme.dark,
      localizationsDelegates: const [S.delegate],
      supportedLocales: S.delegate.supportedLocales,
      home: const LoginPage(),
    );
  }
}
