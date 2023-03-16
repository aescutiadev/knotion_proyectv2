import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project2/common/errors/failure.dart';
import 'package:test_project2/src/login/aplication/user_register_usecase.dart';
import 'package:test_project2/src/login/domain/user_class.dart';

class RegisterUserController extends GetxController with StateMixin {
  RegisterUserController({required this.registerUseCase});
  final UserRegisterUseCase registerUseCase;

  final TextEditingController textFieldName = TextEditingController();
  final TextEditingController textFieldEmail = TextEditingController();
  final TextEditingController textFieldPass = TextEditingController();

  Future<void> registerUser() async {
    change(null, status: RxStatus.loading());
    final user = User(
      id: 0,
      name: textFieldName.value.text,
      email: textFieldEmail.value.text,
      pass: textFieldPass.value.text,
      status: 'online',
    );
    final result = await registerUseCase(user);

    result.fold((Failure l) {
      print(l.message);
      change(null, status: RxStatus.error());
    }, (User r) {
      print(r);
      textFieldName.clear();
      textFieldEmail.clear();
      textFieldPass.clear();
      Get.offAllNamed('/menu');
      change(null, status: RxStatus.success());
    });
  }
}
