import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rote20_gewinnt/l10n/l10n.dart';
import 'package:rote20_gewinnt/src/presentation/pages/home/view/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(final BuildContext context) {
    return RepositoryProvider.value(
      value: RepositoryProvider,
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      // TODO: theme: ,
      // TODO: darkTheme: ,
      localizationsDelegates: const [S.delegate],
      supportedLocales: S.delegate.supportedLocales,
      home: const HomePage(),
    );
  }
}
