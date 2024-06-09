import 'dart:developer';

import 'package:bloc/bloc.dart';

String onTransitionMessage(final Bloc bloc, final Transition transition) => '''
onTransition ${bloc.runtimeType}: Transition
currentState: ${transition.currentState},
event: ${transition.event},
nextState: ${transition.nextState}
''';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onTransition(final Bloc bloc, final Transition transition) {
    super.onTransition(bloc, transition);
    log(onTransitionMessage(bloc, transition));
  }

  @override
  void onError(
      final BlocBase bloc, final Object error, final StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log('onError ${bloc.runtimeType}', error: error, stackTrace: stackTrace);
  }

  @override
  void onEvent(final Bloc bloc, final Object? event) {
    super.onEvent(bloc, event);
    // TODO: implement onEvent (trough Analyticsrepository)
  }

  @override
  void onChange(final BlocBase bloc, final Change change) {
    super.onChange(bloc, change);
    // TODO: implement onChange (trough Analyticsrepository)
  }
}
