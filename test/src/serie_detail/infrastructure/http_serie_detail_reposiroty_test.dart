import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test_project2/src/serie_detail/domain/serie_detail_characters.dart';
import 'package:test_project2/src/serie_detail/domain/serie_detail_class.dart';
import 'package:test_project2/src/serie_detail/domain/serie_detail_episodes.dart';
import 'package:test_project2/src/serie_detail/domain/serie_detail_images.dart';
import 'package:test_project2/src/serie_detail/domain/serie_detail_publisher.dart';
import 'package:test_project2/src/serie_detail/infraestructure/http_serie_detail_reposiroty.dart';

import 'http_serie_detail_reposiroty_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  const Map<String, dynamic> parameters = {
    'api_key': 'b381f398979c82f4e221c53303b9ca3d924689e9',
    'format': 'json',
  };

  HttpSerieDetailRepository? httpSerieDetailReposiroty;
  MockClient? mockClient;

  setUp(() {
    mockClient = MockClient();
    httpSerieDetailReposiroty = HttpSerieDetailRepository(client: mockClient!);
  });

  group('Serie Detail Http', () {
    const serieDetail = SerieDetail(
      aliases: "Agents of SHIELD\r\nMarvel's Agents of S.H.I.E.L.D.",
      apiDetailUrl: 'https://comicvine.gamespot.com/api/series/4075-1/',
      characters: [
        SerieDetailCharacters(
          apiDetailUrl: 'api_detail_url',
          id: 1,
          name: 'name',
          siteDetailUrl: 'site_detail_url',
          count: '1',
        ),
      ],
      countOfEpisodes: 136,
      dateAdded: '2013-09-23 14:13:53',
      dateLastUpdated: '2021-01-27 16:07:24',
      deck: null,
      description: 'description',
      episodes: [
        SerieDetailEpisodes(
          apiDetailUrl: 'api_detail_url',
          id: 1,
          name: 'name',
          siteDetailUrl: 'site_detail_url',
          episodeNumber: '101',
        ),
      ],
      id: 1,
      image: SerieDetailImages(
        iconUrl:
            'https://comicvine.gamespot.com/a/uploads/square_avatar/6/67663/6238345-3060875932-35677.jpg',
        mediumUrl:
            'https://comicvine.gamespot.com/a/uploads/scale_medium/6/67663/6238345-3060875932-35677.jpg',
        screenUrl:
            'https://comicvine.gamespot.com/a/uploads/screen_medium/6/67663/6238345-3060875932-35677.jpg',
        screenLargeUrl:
            'https://comicvine.gamespot.com/a/uploads/screen_kubrick/6/67663/6238345-3060875932-35677.jpg',
        smallUrl:
            'https://comicvine.gamespot.com/a/uploads/scale_small/6/67663/6238345-3060875932-35677.jpg',
        superUrl:
            'https://comicvine.gamespot.com/a/uploads/scale_large/6/67663/6238345-3060875932-35677.jpg',
        thumbUrl:
            'https://comicvine.gamespot.com/a/uploads/scale_avatar/6/67663/6238345-3060875932-35677.jpg',
        tinyUrl:
            'https://comicvine.gamespot.com/a/uploads/square_mini/6/67663/6238345-3060875932-35677.jpg',
        originalUrl:
            'https://comicvine.gamespot.com/a/uploads/original/6/67663/6238345-3060875932-35677.jpg',
        imageTags: 'All Images',
      ),
      name: 'Agents of S.H.I.E.L.D.',
      publisher: SerieDetailPublisher(
        apiDetailUrl: 'api_detail_url',
        id: 31,
        name: 'name',
      ),
      siteDetailUrl: 'site_detail_url',
      startYear: '2013',
    );
    const mockResponse = {
      "results": {
        "aliases": "Agents of SHIELD\r\nMarvel's Agents of S.H.I.E.L.D.",
        "api_detail_url": "https://comicvine.gamespot.com/api/series/4075-1/",
        "characters": [
          {
            "api_detail_url": "api_detail_url",
            "id": 1,
            "name": "name",
            "site_detail_url": "site_detail_url",
            "count": "1"
          }
        ],
        "count_of_episodes": 136,
        "date_added": "2013-09-23 14:13:53",
        "date_last_updated": "2021-01-27 16:07:24",
        "deck": null,
        "description": "description",
        "episodes": [
          {
            "api_detail_url": "api_detail_url",
            "id": 1,
            "name": "name",
            "site_detail_url": "site_detail_url",
            "episode_number": "101"
          },
        ],
        "first_episode": {
          "api_detail_url":
              "https://comicvine.gamespot.com/api/episode/4070-1/",
          "id": 1,
          "name": "Pilot",
          "episode_number": "101"
        },
        "id": 1,
        "image": {
          "icon_url":
              "https://comicvine.gamespot.com/a/uploads/square_avatar/6/67663/6238345-3060875932-35677.jpg",
          "medium_url":
              "https://comicvine.gamespot.com/a/uploads/scale_medium/6/67663/6238345-3060875932-35677.jpg",
          "screen_url":
              "https://comicvine.gamespot.com/a/uploads/screen_medium/6/67663/6238345-3060875932-35677.jpg",
          "screen_large_url":
              "https://comicvine.gamespot.com/a/uploads/screen_kubrick/6/67663/6238345-3060875932-35677.jpg",
          "small_url":
              "https://comicvine.gamespot.com/a/uploads/scale_small/6/67663/6238345-3060875932-35677.jpg",
          "super_url":
              "https://comicvine.gamespot.com/a/uploads/scale_large/6/67663/6238345-3060875932-35677.jpg",
          "thumb_url":
              "https://comicvine.gamespot.com/a/uploads/scale_avatar/6/67663/6238345-3060875932-35677.jpg",
          "tiny_url":
              "https://comicvine.gamespot.com/a/uploads/square_mini/6/67663/6238345-3060875932-35677.jpg",
          "original_url":
              "https://comicvine.gamespot.com/a/uploads/original/6/67663/6238345-3060875932-35677.jpg",
          "image_tags": "All Images"
        },
        "last_episode": {
          "api_detail_url":
              "https://comicvine.gamespot.com/api/episode/4070-32765/",
          "id": 32765,
          "name": "The End Is At Hand",
          "episode_number": "712"
        },
        "name": "Agents of S.H.I.E.L.D.",
        "publisher": {
          "api_detail_url": "api_detail_url",
          "id": 31,
          "name": "name"
        },
        "site_detail_url": "site_detail_url",
        "start_year": "2013"
      },
      "version": "1.0"
    };
    test('Get serie detail http success', () async {
      when(mockClient!.get(Uri.parse(
              "${serieDetail.apiDetailUrl.toString()}?api_key=${parameters['api_key']}&format=json")))
          .thenAnswer((_) => Future.value(http.Response(
                jsonEncode(mockResponse),
                200,
              )));

      final result = await httpSerieDetailReposiroty!
          .getSerieDetail(serieDetail.apiDetailUrl.toString());

      expect(result, serieDetail);
    });

    test('Failure at get series of API', () async {
      when(mockClient!.get(Uri.parse(
              "${serieDetail.apiDetailUrl.toString()}?api_key=${parameters['api_key']}&format=json")))
          .thenThrow(Exception());

      final result = httpSerieDetailReposiroty!
          .getSerieDetail(serieDetail.apiDetailUrl.toString());

      expect(
        result,
        throwsA(
          isA<Exception>(),
        ),
      );
    });
  });
}
