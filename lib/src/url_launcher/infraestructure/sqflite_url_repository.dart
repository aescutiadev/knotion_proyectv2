import 'package:sqflite/sqflite.dart';
import 'package:test_project2/common/constants/constants.dart';
import 'package:test_project2/common/errors/failure.dart';
import 'package:test_project2/src/url_launcher/domain/url_class.dart';
import 'package:test_project2/src/url_launcher/domain/url_repository.dart';

class SqFliteUrlRepository extends UrlRepository {
  SqFliteUrlRepository({required this.client});

  final Database client;

  @override
  Future<Url> saveUrl(Url url) async {
    final response = await client.rawInsert(
      'INSERT INTO url (name) VALUES (?)',
      [url.url.toString()],
    );
    print(response);
    if (response == 0) {
      throw const ServerFailure(message: AppErrorMessages.serverError);
    }
    return url;
  }

  @override
  Future<List<Url>> getUrls() async {
    List<Map<String, Object?>> urlsMap =
        await client.rawQuery('SELECT * FROM url');

    final urlsList = urlsMap.map((e) => Url(url: '${e['name']}')).toList();

    return urlsList;
  }
}
