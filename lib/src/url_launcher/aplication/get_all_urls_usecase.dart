import 'package:dartz/dartz.dart';
import 'package:test_project2/common/constants/constants.dart';
import 'package:test_project2/common/errors/failure.dart';
import 'package:test_project2/src/url_launcher/domain/url_class.dart';
import 'package:test_project2/src/url_launcher/infraestructure/sqflite_url_repository.dart';

class GetAllUrlsUseCase {
  GetAllUrlsUseCase({required this.urlRepository});
  final SqFliteUrlRepository urlRepository;

  Future<Either<Failure, List<Url>>> call() async {
    try {
      final response = await urlRepository.getUrls();
      return Right(response);
    } catch (e) {
      return const Left(ServerFailure(message: AppErrorMessages.databaseError));
    }
  }
}
