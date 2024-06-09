import 'package:equatable/equatable.dart';

class Player extends Equatable {
  const Player({
    required this.name,
    required this.tag,
    this.uid,
  }) : assert(0 <= tag && tag < 10000, 'tag must be 4 digit');

  final String name;
  final int tag;
  final String? uid;

  String get playerNametag => '$name#$tag';
  bool get isRegisteredUser => uid != null;

  @override
  List<Object?> get props => [name, tag, uid];
}
