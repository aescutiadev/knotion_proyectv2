import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class SerieDetailEpisodes extends Equatable {
  final String? apiDetailUrl;
  final int? id;
  final String? name;
  final String? siteDetailUrl;
  final String? episodeNumber;

  const SerieDetailEpisodes({
    required this.apiDetailUrl,
    required this.id,
    required this.name,
    required this.siteDetailUrl,
    required this.episodeNumber,
  });

  @override
  List<Object?> get props => [
        apiDetailUrl,
        id,
        name,
        siteDetailUrl,
        episodeNumber,
      ];
}
