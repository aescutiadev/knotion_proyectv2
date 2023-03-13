import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test_project2/common/constants/constants.dart';
import 'package:test_project2/common/errors/failure.dart';
import 'package:test_project2/src/serie_detail/aplication/get_serie_detail.dart';
import 'package:test_project2/src/serie_detail/domain/serie_detail_characters.dart';
import 'package:test_project2/src/serie_detail/domain/serie_detail_class.dart';
import 'package:test_project2/src/serie_detail/domain/serie_detail_episodes.dart';
import 'package:test_project2/src/serie_detail/domain/serie_detail_images.dart';
import 'package:test_project2/src/serie_detail/domain/serie_detail_publisher.dart';
import 'package:test_project2/src/serie_detail/domain/serie_detail_repository.dart';

import 'get_serie_detail_test.mocks.dart';

@GenerateMocks([SerieDetailRepository])
void main() {
  GetSerieDetail? getSerieDetail;

  MockSerieDetailRepository? mockSerieDetailRepository;

  const serieDetail = SerieDetail(
    aliases: 'aliases',
    apiDetailUrl: 'apiDetailUrl',
    characters: [
      SerieDetailCharacters(
        apiDetailUrl: 'apiDetailUrl',
        id: 1,
        name: 'name',
        siteDetailUrl: 'siteDetailUrl',
        count: 'count',
      ),
    ],
    countOfEpisodes: 1,
    dateAdded: 'dateAdded',
    dateLastUpdated: 'dateLastUpdated',
    deck: 'deck',
    description: 'description',
    episodes: [
      SerieDetailEpisodes(
        apiDetailUrl: 'apiDetailUrl',
        id: 1,
        name: 'name',
        siteDetailUrl: 'siteDetailUrl',
        episodeNumber: 'episodeNumber',
      )
    ],
    id: 1,
    image: SerieDetailImages(
      iconUrl: 'iconUrl',
      mediumUrl: 'mediumUrl',
      screenUrl: 'screenUrl',
      screenLargeUrl: 'screenLargeUrl',
      smallUrl: 'smallUrl',
      superUrl: 'superUrl',
      thumbUrl: 'thumbUrl',
      tinyUrl: 'tinyUrl',
      originalUrl: 'originalUrl',
      imageTags: 'imageTags',
    ),
    name: 'name',
    publisher: SerieDetailPublisher(
      apiDetailUrl: 'apiDetailUrl',
      id: 1,
      name: 'name',
    ),
    siteDetailUrl: 'siteDetailUrl',
    startYear: 'startYear',
  );

  setUp(() {
    mockSerieDetailRepository = MockSerieDetailRepository();
    getSerieDetail = GetSerieDetail(
      serieDetailRepository: mockSerieDetailRepository!,
    );
  });

  group('Serie Detail', () {
    test('Get serie detail reporitory success', () async {
      when(mockSerieDetailRepository!.getSerieDetail(
              'https://comicvine.gamespot.com/api/series/4075-1/'))
          .thenAnswer((_) => Future.value(serieDetail));

      final result = await getSerieDetail!(
        'https://comicvine.gamespot.com/api/series/4075-1/',
      );

      expect(result, const Right(serieDetail));
    });

    test('Get serie detail reporitory failure', () async {
      when(mockSerieDetailRepository!.getSerieDetail(
              'https://comicvine.gamespot.com/api/series/4075-1/'))
          .thenThrow(Exception());

      final result = await getSerieDetail!(
        'https://comicvine.gamespot.com/api/series/4075-1/',
      );

      expect(result,
          const Left(ServerFailure(message: AppErrorMessages.serverError)));
    });
  });
}
