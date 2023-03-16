import 'package:test_project2/src/login/domain/user_class.dart';

abstract class UserRepository {
  Future<User> registerUser(User user);
  Future<bool> validateUser(String email, String pass);
}
