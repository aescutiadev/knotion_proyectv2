import 'package:dartz/dartz.dart';
import 'package:test_project2/common/constants/constants.dart';
import 'package:test_project2/common/errors/failure.dart';
import 'package:test_project2/src/serie_detail/domain/serie_detail_class.dart';
import 'package:test_project2/src/serie_detail/domain/serie_detail_repository.dart';

class GetSerieDetail {
  final SerieDetailRepository serieDetailRepository;

  GetSerieDetail({required this.serieDetailRepository});

  Future<Either<Failure, SerieDetail>> call(String baseUrl) async {
    try {
      final response = await serieDetailRepository.getSerieDetail(baseUrl);
      return Right(response);
    } catch (e) {
      return const Left(ServerFailure(message: AppErrorMessages.serverError));
    }
  }
}
