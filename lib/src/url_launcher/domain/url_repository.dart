import 'package:test_project2/src/url_launcher/domain/url_class.dart';

abstract class UrlRepository {
  Future<Url> saveUrl(Url url);
  Future<List<Url>> getUrls();
}
