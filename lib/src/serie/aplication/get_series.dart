import 'package:dartz/dartz.dart';
import 'package:test_project2/common/constants/constants.dart';
import 'package:test_project2/common/errors/failure.dart';
import 'package:test_project2/src/serie/domain/serie_class.dart';
import 'package:test_project2/src/serie/domain/serie_repository.dart';

class GetSeries {
  final SerieRepository serieRepository;

  GetSeries({required this.serieRepository});

  Future<Either<Failure, List<Serie>>> call(
      {required int limit, required int offset}) async {
    try {
      final response = await serieRepository.getAllSeries(
        limit: limit,
        offset: offset,
      );
      return Right(response);
    } catch (e) {
      return const Left(ServerFailure(message: AppErrorMessages.serverError));
    }
  }
}
