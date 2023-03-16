import 'package:get/get.dart';
import 'package:test_project2/src/login/aplication/validate_user_usecase.dart';
import 'package:test_project2/src/login/infrastructure/sqflite_user_repository.dart';
import 'package:test_project2/ui/getx/login/login_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(validateUserUseCase: Get.find()));
    Get.lazyPut(() => ValidateUserUseCase(userRepository: Get.find()));
    Get.lazyPut(() => SqFliteUserRepository(client: Get.find()));
  }
}
