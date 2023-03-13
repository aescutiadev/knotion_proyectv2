import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_project2/common/constants/constants.dart';
import 'package:test_project2/common/errors/failure.dart';
import 'package:test_project2/src/serie_detail/domain/serie_detail_characters.dart';
import 'package:test_project2/src/serie_detail/domain/serie_detail_class.dart';
import 'package:test_project2/src/serie_detail/domain/serie_detail_episodes.dart';
import 'package:test_project2/src/serie_detail/domain/serie_detail_images.dart';
import 'package:test_project2/src/serie_detail/domain/serie_detail_publisher.dart';
import 'package:test_project2/src/serie_detail/domain/serie_detail_repository.dart';

class HttpSerieDetailRepository extends SerieDetailRepository {
  static const Map<String, dynamic> parameters = {
    'api_key': 'b381f398979c82f4e221c53303b9ca3d924689e9',
    'format': 'json',
  };
  final http.Client client;

  HttpSerieDetailRepository({required this.client});

  @override
  Future<SerieDetail> getSerieDetail(String baseUrl) async {
    final response = await client.get(
        Uri.parse("$baseUrl?api_key=${parameters['api_key']}&format=json"));

    if (response.statusCode == 200) {
      try {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final Map<String, dynamic> serieDetailData = data['results'];
        final List<dynamic> characters = serieDetailData['characters'];
        final List<dynamic> episodes = serieDetailData['episodes'];
        final SerieDetail serieDetail = SerieDetail(
          aliases: serieDetailData['aliases'] ?? '',
          apiDetailUrl: serieDetailData['api_detail_url'],
          characters: characters
              .map((json) => SerieDetailCharacters(
                    apiDetailUrl: json['api_detail_url'],
                    id: json['id'],
                    name: json['name'],
                    siteDetailUrl: json['site_detail_url'],
                    count: json['count'],
                  ))
              .toList(),
          countOfEpisodes: serieDetailData['count_of_episodes'],
          dateAdded: serieDetailData['date_added'],
          dateLastUpdated: serieDetailData['date_last_updated'],
          deck: serieDetailData['deck'],
          description: serieDetailData['description'],
          episodes: episodes
              .map((json) => SerieDetailEpisodes(
                    apiDetailUrl: json['api_detail_url'],
                    id: json['id'],
                    name: json['name'],
                    siteDetailUrl: json['site_detail_url'],
                    episodeNumber: json['episode_number'],
                  ))
              .toList(),
          id: serieDetailData['id'],
          image: SerieDetailImages(
            iconUrl: serieDetailData['image']['icon_url'],
            mediumUrl: serieDetailData['image']['medium_url'],
            screenUrl: serieDetailData['image']['screen_url'],
            screenLargeUrl: serieDetailData['image']['screen_large_url'],
            smallUrl: serieDetailData['image']['small_url'],
            superUrl: serieDetailData['image']['super_url'],
            thumbUrl: serieDetailData['image']['thumb_url'],
            tinyUrl: serieDetailData['image']['tiny_url'],
            originalUrl: serieDetailData['image']['original_url'],
            imageTags: serieDetailData['image']['image_tags'],
          ),
          name: serieDetailData['name'],
          publisher: serieDetailData['publisher'] != null
              ? SerieDetailPublisher(
                  apiDetailUrl: serieDetailData['publisher']['api_detail_url'],
                  id: serieDetailData['publisher']['id'],
                  name: serieDetailData['publisher']['name'],
                )
              : const SerieDetailPublisher(
                  apiDetailUrl: '',
                  id: 0,
                  name: '',
                ),
          siteDetailUrl: serieDetailData['site_detail_url'],
          startYear: serieDetailData['start_year'],
        );
        return serieDetail;
      } catch (e) {
        print('Ocurrió un error: $e');
      }
    }

    return throw const ServerFailure(message: AppErrorMessages.serverError);
  }
}
