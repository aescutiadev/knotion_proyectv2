import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_project2/src/serie/domain/serie_class.dart';
import 'package:test_project2/src/serie/domain/serie_images.dart';
import 'package:test_project2/src/serie/domain/serie_publisher.dart';
import 'package:test_project2/src/serie/domain/serie_repository.dart';

class HttpSerieRepository extends SerieRepository {
  static const baseUrl = 'https://comicvine.gamespot.com/api/series_list/';
  static const Map<String, dynamic> parameters = {
    'api_key': 'b381f398979c82f4e221c53303b9ca3d924689e9',
    'format': 'json',
  };

  final http.Client client;

  HttpSerieRepository({required this.client});

  @override
  Future<List<Serie>> getAllSeries() async {
    final response = await client.get(
      Uri.parse("$baseUrl?api_key=${parameters['api_key']}&format=json"),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> seriesData = data['results'];
      try {
        final List<Serie> series = seriesData
            .map((json) => Serie(
                aliases: json['aliases'],
                apiDetailUrl: json['api_detail_url'],
                countOfEpisodes: json['count_of_episodes'],
                dateAdded: json['date_added'],
                dateLastUpdated: json['date_last_updated'],
                deck: json['deck'],
                description: json['description'],
                id: json['id'],
                image: SerieImage(
                  iconUrl: json['image']['icon_url'],
                  mediumUrl: json['image']['medium_url'],
                  screenUrl: json['image']['screen_url'],
                  screenLargeUrl: json['image']['screen_large_url'],
                  smallUrl: json['image']['small_url'],
                  superUrl: json['image']['super_url'],
                  thumbUrl: json['image']['thumb_url'],
                  tinyUrl: json['image']['tiny_url'],
                  originalUrl: json['image']['original_url'],
                  imageTags: json['image']['image_tags'],
                ),
                name: json['name'],
                publisher: json['publisher'] != null
                    ? Publisher(
                        apiDetailUrl: json['publisher']['api_detail_url'],
                        id: json['publisher']['id'],
                        name: json['publisher']['name'],
                      )
                    : const Publisher(
                        apiDetailUrl: null,
                        id: null,
                        name: null,
                      ),
                siteDetailUrl: json['site_detail_url'],
                startYear: json['start_year']))
            .toList();
        return series;
      } catch (e) {
        print(e);
      }
      return [];
    } else {
      throw Exception();
    }
  }
}
