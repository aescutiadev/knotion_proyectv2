import 'package:either_dart/either.dart';
import 'package:test_project2/common/constants/constants.dart';
import 'package:test_project2/common/errors/failure.dart';
import 'package:test_project2/src/url_launcher/domain/url_class.dart';
import 'package:test_project2/src/url_launcher/infraestructure/sqflite_url_repository.dart';

class UrlSaveUseCase {
  UrlSaveUseCase({required this.urlRepository});
  final SqFliteUrlRepository urlRepository;

  Future<Either<Failure, Url>> call(Url url) async {
    try {
      final response = await urlRepository.saveUrl(url);
      return Right(response);
    } catch (e) {
      return const Left(ServerFailure(message: AppErrorMessages.databaseError));
    }
  }
}
