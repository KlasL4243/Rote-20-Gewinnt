import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rote20_gewinnt/app/cubit/app_cubit.dart';
import 'package:rote20_gewinnt/l10n/l10n.dart';
import 'package:rote20_gewinnt/theme/theme.dart';

class App extends StatelessWidget {
  const App({required this.appRepository, super.key});

  final AppRepository appRepository;

  @override
  Widget build(BuildContext context) {
    final Locale locale = Localizations.localeOf(context);

    return RepositoryProvider.value(
        value: appRepository,
        child: BlocProvider<AppCubit>(
          create: (_) => AppCubit(locale: locale),
          child: const AppView(),
        ));
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return MaterialApp(
            locale: state.locale,
            theme: FlutterAppTheme.light,
            darkTheme: FlutterAppTheme.dark,
            localizationsDelegates: const <LocalizationsDelegate> [ S.delegate ],
            supportedLocales: S.delegate.supportedLocales,
            home: const HomePage());
      },
    );
  }
}
