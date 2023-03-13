import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Publisher extends Equatable {
  final String? apiDetailUrl;
  final int? id;
  final String? name;

  const Publisher({
    required this.apiDetailUrl,
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [apiDetailUrl, id, name];
}
