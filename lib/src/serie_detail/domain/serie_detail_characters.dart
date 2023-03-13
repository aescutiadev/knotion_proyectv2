import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class SerieDetailCharacters extends Equatable {
  final String? apiDetailUrl;
  final int? id;
  final String? name;
  final String? siteDetailUrl;
  final String? count;

  const SerieDetailCharacters({
    required this.apiDetailUrl,
    required this.id,
    required this.name,
    required this.siteDetailUrl,
    required this.count,
  });
  @override
  List<Object?> get props => [
        apiDetailUrl,
        id,
        name,
        siteDetailUrl,
        count,
      ];
}
