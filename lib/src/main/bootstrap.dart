import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:rote20_gewinnt/src/main/app_bloc_observer.dart';

Future<void> bootstrap(final Future<Widget> Function() builder) async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await initializeDateFormatting();

      Bloc.observer = const AppBlocObserver();
      runApp(await builder());
    },
    (final object, final stackTrace) {},
  );
}
