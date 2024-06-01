import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:rote20_gewinnt/app/app_bloc_observer.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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

