import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.pass,
    required this.status,
  });

  final int id;
  final String name;
  final String email;
  final String pass;
  final String status;

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        pass,
        status,
      ];
}
