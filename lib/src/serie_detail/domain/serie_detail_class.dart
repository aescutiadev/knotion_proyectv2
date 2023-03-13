import 'package:equatable/equatable.dart';
import 'package:test_project2/src/serie_detail/domain/serie_detail_characters.dart';
import 'package:test_project2/src/serie_detail/domain/serie_detail_episodes.dart';
import 'package:test_project2/src/serie_detail/domain/serie_detail_images.dart';
import 'package:test_project2/src/serie_detail/domain/serie_detail_publisher.dart';

class SerieDetail extends Equatable {
  final String? aliases;
  final String? apiDetailUrl;
  final List<SerieDetailCharacters>? characters;
  final int? countOfEpisodes;
  final String? dateAdded;
  final String? dateLastUpdated;
  final String? deck;
  final String? description;
  final List<SerieDetailEpisodes>? episodes;
  final int? id;
  final SerieDetailImages? image;
  final String? name;
  final SerieDetailPublisher? publisher;
  final String? siteDetailUrl;
  final String? startYear;

  const SerieDetail({
    required this.aliases,
    required this.apiDetailUrl,
    required this.characters,
    required this.countOfEpisodes,
    required this.dateAdded,
    required this.dateLastUpdated,
    required this.deck,
    required this.description,
    required this.episodes,
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
        characters,
        countOfEpisodes,
        dateAdded,
        dateLastUpdated,
        deck,
        description,
        episodes,
        id,
        image,
        name,
        publisher,
        siteDetailUrl,
        startYear,
      ];
}
