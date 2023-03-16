import 'package:dartz/dartz.dart';
import 'package:test_project2/common/constants/constants.dart';
import 'package:test_project2/common/errors/failure.dart';
import 'package:test_project2/src/login/infrastructure/sqflite_user_repository.dart';

class ValidateUserUseCase {
  ValidateUserUseCase({required this.userRepository});
  final SqFliteUserRepository userRepository;

  Future<Either<Failure, bool>> call({
    required String email,
    required String pass,
  }) async {
    try {
      final response = await userRepository.validateUser(email, pass);
      return Right(response);
    } catch (e) {
      print(e);
      return const Left(ServerFailure(message: AppErrorMessages.databaseError));
    }
  }
}
