import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test_project2/common/constants/constants.dart';
import 'package:test_project2/common/errors/failure.dart';
import 'package:test_project2/src/serie/aplication/get_series.dart';
import 'package:test_project2/src/serie/domain/serie_class.dart';
import 'package:test_project2/src/serie/domain/serie_repository.dart';

import 'get_series_test.mocks.dart';

@GenerateMocks([SerieRepository])
void main() {
  GetSeries? getSeries;

  MockSerieRepository? mockSerieRepository;

  setUp(() {
    mockSerieRepository = MockSerieRepository();
    getSeries = GetSeries(
      serieRepository: mockSerieRepository!,
    );
  });

  final serieList = <Serie>[];

  group('GetSeries', () {
    test('should get a list of series', () async {
      when(mockSerieRepository!.getAllSeries(
        limit: 100,
        offset: 0,
      )).thenAnswer((_) async => Future.value(serieList));

      final result = await getSeries!(
        limit: 100,
        offset: 0,
      );

      expect(result, Right(serieList));
    });

    test('failure get a list of series', () async {
      when(mockSerieRepository!.getAllSeries(
        limit: 100,
        offset: 0,
      )).thenThrow(Exception());

      final result = await getSeries!(
        limit: 100,
        offset: 0,
      );

      expect(result,
          const Left(ServerFailure(message: AppErrorMessages.serverError)));
    });
  });
}
