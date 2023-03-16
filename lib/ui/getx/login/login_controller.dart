import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project2/common/errors/failure.dart';
import 'package:test_project2/src/login/aplication/validate_user_usecase.dart';

class LoginController extends GetxController with StateMixin {
  LoginController({required this.validateUserUseCase});
  final ValidateUserUseCase validateUserUseCase;

  final formKey = GlobalKey<FormState>();
  final email = ''.obs;
  final pass = ''.obs;
  final validate = false.obs;

  void validateForm() {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    print(email);
    print(pass);
    //validateUser();
  }

  Future<void> validateUser() async {
    final result = await validateUserUseCase(
      email: email.value,
      pass: pass.value,
    );

    result.fold((Failure l) {
      change(l.message, status: RxStatus.error());
    }, (bool r) {
      if (r) {
        validate.value = r;
        Get.offAllNamed('/menu');
        change(null, status: RxStatus.success());
      } else {
        validate.value = r;
      }
    });
  }
}
