import 'package:test_project2/src/serie_detail/domain/serie_detail_class.dart';

abstract class SerieDetailRepository {
  Future<SerieDetail> getSerieDetail(String baseUrl);
}
