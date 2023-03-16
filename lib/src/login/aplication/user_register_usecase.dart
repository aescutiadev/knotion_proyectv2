import 'package:dartz/dartz.dart';
import 'package:test_project2/common/constants/constants.dart';
import 'package:test_project2/common/errors/failure.dart';
import 'package:test_project2/src/login/domain/user_class.dart';
import 'package:test_project2/src/login/infrastructure/sqflite_user_repository.dart';

class UserRegisterUseCase {
  UserRegisterUseCase({required this.userRepository});
  final SqFliteUserRepository userRepository;

  Future<Either<Failure, User>> call(User user) async {
    try {
      final response = await userRepository.registerUser(user);
      return Right(response);
    } catch (e) {
      return const Left(ServerFailure(message: AppErrorMessages.databaseError));
    }
  }
}
