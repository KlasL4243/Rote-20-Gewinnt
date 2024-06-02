part of 'app_cubit.dart';

@immutable
final class AppState extends Equatable {
  const AppState({required this.locale});

  final Locale locale;

  @override
  List<Object> get props => [locale];
}
