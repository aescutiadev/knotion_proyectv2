import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project2/ui/getx/login/login_controller.dart';

class LoginPage extends GetWidget<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                validator: (value) {
                  if (!value!.isEmail) {
                    return 'El correo no es valido';
                  }
                  if (value == "" || value.isEmpty) {
                    return 'Se requiere colocar el correo';
                  }
                  return null;
                },
                onSaved: (newValue) => controller.email.value = newValue!,
              ),
              const SizedBox(height: 10),
              TextFormField(
                obscureText: true,
                validator: (value) {
                  if (value == "" || value!.isEmpty) {
                    return 'Se requiere colocar la contraseña';
                  }
                  return null;
                },
                onSaved: (newValue) => controller.pass.value = newValue!,
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: () {
                  controller.validateForm();
                },
                child: const Text('Login'),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: () => Get.toNamed('/register'),
                child: const Text('Registro'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
