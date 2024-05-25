part of 'home_cubit.dart';

enum HomeTab { todos, stats }

final class HomeState extends Equatable {
  const HomeState();


  @override
  List<Object> get props => [hashCode];
}