import 'package:get/get.dart';
import 'package:test_project2/src/login/aplication/user_register_usecase.dart';
import 'package:test_project2/src/login/infrastructure/sqflite_user_repository.dart';
import 'package:test_project2/ui/getx/login_register/login_register_controller.dart';

class LoginRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterUserController(registerUseCase: Get.find()));
    Get.lazyPut(() => UserRegisterUseCase(userRepository: Get.find()));
    Get.lazyPut(() => SqFliteUserRepository(client: Get.find()));
  }
}
