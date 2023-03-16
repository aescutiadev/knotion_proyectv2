import 'package:equatable/equatable.dart';

class Url extends Equatable {
  const Url({required this.url});

  final String url;

  @override
  List<Object?> get props => [url];
}
