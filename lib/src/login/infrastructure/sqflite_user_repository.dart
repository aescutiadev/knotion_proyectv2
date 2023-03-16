import 'package:sqflite/sqflite.dart';
import 'package:test_project2/common/constants/constants.dart';
import 'package:test_project2/common/errors/failure.dart';
import 'package:test_project2/src/login/domain/user_class.dart';
import 'package:test_project2/src/login/domain/user_repository.dart';

class SqFliteUserRepository extends UserRepository {
  SqFliteUserRepository({required this.client});

  final Database client;

  @override
  Future<User> registerUser(User user) async {
    final response = await client.rawInsert(
        'INSERT INTO users (name, email, pass, status) VALUES (?, ?, ?, ?)', [
      user.name.toString(),
      user.email.toString(),
      user.pass.toString(),
      user.status.toString(),
    ]);
    if (response == 0) {
      throw const ServerFailure(message: AppErrorMessages.serverError);
    }
    return user;
  }

  @override
  Future<bool> validateUser(String email, String pass) async {
    final response = await client
        .query('SELECT email FROM url WHERE email = $email AND pass = $pass');
    print('Error desde repositorio $response');
    if (response.isEmpty) {
      return false;
    }
    return true;
  }
}
