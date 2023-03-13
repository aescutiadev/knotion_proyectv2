import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:test_project2/src/serie/domain/serie_images.dart';
import 'package:test_project2/src/serie/domain/serie_publisher.dart';

@immutable
class Serie extends Equatable {
  final String? aliases;
  final String? apiDetailUrl;
  final int? countOfEpisodes;
  final String? dateAdded;
  final String? dateLastUpdated;
  final String? deck;
  final String? description;
  final int? id;
  final SerieImage image;
  final String? name;
  final Publisher publisher;
  final String? siteDetailUrl;
  final String? startYear;

  const Serie({
    required this.aliases,
    required this.apiDetailUrl,
    required this.countOfEpisodes,
    required this.dateAdded,
    required this.dateLastUpdated,
    required this.deck,
    required this.description,
    required this.id,
    required this.image,
    required this.name,
    required this.publisher,
    required this.siteDetailUrl,
    required this.startYear,
  });

  @override
  List<Object?> get props => [
        aliases,
        apiDetailUrl,
        countOfEpisodes,
        dateAdded,
        dateLastUpdated,
        deck,
        description,
        id,
        image,
        publisher,
        name,
        siteDetailUrl,
        startYear,
      ];
}
