import 'dart:async';

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:rote20_gewinnt/main/bootstrap/bootstrap.dart';
import 'package:rote20_gewinnt/app/view/app.dart';
import 'package:shared_preferences/shared_preferences.dart';


typedef AppBuilder = Future<Widget> Function(
  SharedPreferences sharedPreferences
);

Future<void> bootstrap(AppBuilder builder) async {
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();



    },
    (_, __) {},
  );
}

/*



Future<void> main() async {
  
  initializeDateFormatting();

  final gameApi = LocalStorageGameApi(
    sharedPreferences: await SharedPreferences.getInstance(),
  );

  final GameRepository gameRepository =
      gameRepository(gamesApi: gameApi);

  FlutterError.onError = (details) => log(details.exceptionAsString(), stackTrace: details.stack);

  Bloc.observer = const AppBlocObserver();

  runZonedGuarded(
    () => runApp(App(gameRepository: gameRepository)),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );


}
*/
