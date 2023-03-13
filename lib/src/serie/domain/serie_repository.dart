import 'package:test_project2/src/serie/domain/serie_class.dart';

abstract class SerieRepository {
  Future<List<Serie>> getAllSeries({required int limit, required int offset});
}
