import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' show Locale, immutable;

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({required Locale locale}) : super(AppState(locale: locale));

  void setLocale(Locale locale) => emit(AppState(locale: locale));
}
