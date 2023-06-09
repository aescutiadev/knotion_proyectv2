import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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
    _validateUser();
  }

  Future<void> _validateUser() async {
    final result = await validateUserUseCase(
      email: email.value,
      pass: pass.value,
    );
    print(result);
    result.fold((Failure l) {
      change(l.message, status: RxStatus.error());
    }, (bool r) {
      if (r) {
        validate.value = r;
        Get.offAllNamed('/menu', arguments: email.value);
        GetStorage().write('session', email.value);
        change(null, status: RxStatus.success());
      } else {
        validate.value = r;
      }
    });
  }
}
