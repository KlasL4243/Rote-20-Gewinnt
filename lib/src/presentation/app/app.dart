import 'package:flutter/material.dart';
import 'package:rote20_gewinnt/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(final BuildContext context) {
    return const AppView();
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      // theme: ,
      // darkTheme: , TODO: setup App themes
      localizationsDelegates: const [S.delegate],
      supportedLocales: S.delegate.supportedLocales,
      // home: const HomePage(), TODO: setup root page
    );
  }
}
