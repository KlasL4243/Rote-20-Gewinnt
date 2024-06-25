import 'package:equatable/equatable.dart';

class Player extends Equatable {
  Player({
    required this.name,
  });
  final String name;

  @override
  // TODO: implement props
  List<Object?> get props => [name];
}
